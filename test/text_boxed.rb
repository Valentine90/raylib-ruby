# frozen_string_literal: true

# Desenha o texto em uma caixa (retângulo).
module Raylib
  State = ray_enum %w[
    Measure
    Draw
  ]

  # Desenha o texto dentro dos limites do retângulo sem suporte para
  # seleção de texto.
  # @param font [Font] Fonte.
  # @param text [String] Texto.
  # @param rec [Rectangle] Retângulo.
  # @param options [Hash{Symbol => Float, Float, Color}] Opções: font_size,
  #   spacing, tint.
  def draw_text_boxed(font, text, rec, options)
    options[:select_start] = 0
    options[:select_length] = 0
    options[:select_tint] = WHITE
    options[:select_back_tint] = BLANK
    draw_text_boxed_selectable(font, text, rec, options)
  end

  # Desenha o texto dentro dos limites do retângulo com suporte para
  # seleção de texto.
  # @param font [Font] Fonte.
  # @param text [String] Texto.
  # @param rec [Rectangle] Retângulo.
  # @param options [Hash{Symbol => Float, Float, Color, Integer, Integer,
  #   Color, Color}] Opções: font_size, spacing, tint, select_start,
  #   select_length, select_tint e select_back_tint.
  def draw_text_boxed_selectable(font, text, rec, options)
    font_size = options[:font_size]
    spacing = options[:spacing]
    tint = options[:tint]
    select_start = options[:select_start]
    select_length = options[:select_length]
    select_tint = options[:select_tint]
    select_back_tint = options[:select_back_tint]

    scale_factor = font_size / font.base_size.to_f
    state = State::Measure
    text_offset_x = 0
    text_offset_y = 0
    start_line = -1
    end_line = -1
    lastk = -1

    i = 0
    k = 0
    while i < text.size
      codepoint = text[i]

      if codepoint == "\n"
        glyph_width = 0
      else
        glyph_width = calculate_glyph_width(font, scale_factor, codepoint)
        glyph_width += spacing if i + 1 < text.size
      end

      if state == State::Measure
        state, end_line = update_measure_state(
          text,
          rec,
          state,
          text_offset_x,
          start_line,
          end_line,
          codepoint,
          glyph_width,
          i
        )

        if state == State::Draw
          text_offset_x = 0
          i = start_line
          glyph_width = 0
          tmp = lastk
          lastk = k - 1
          k = tmp
        end
      else
        unless codepoint == "\n"
          break if text_offset_y + (font.base_size * scale_factor) > rec.height

          draw_text_character(
            font,
            font_size,
            scale_factor,
            rec,
            tint,
            select_start,
            select_length,
            select_tint,
            select_back_tint,
            text_offset_x,
            text_offset_y,
            codepoint,
            glyph_width,
            k
          )
        end

        if i == end_line
          text_offset_y += (font.base_size + (font.base_size / 2)) * scale_factor
          text_offset_x = 0
          start_line = end_line
          end_line = -1
          glyph_width = 0
          select_start += lastk - k
          k = lastk
          state = State::Measure
        end
      end

      text_offset_x += glyph_width if text_offset_x != 0 || codepoint != ' '

      i += 1
      k += 1
    end
  end

  private

  # Calcula a largura do glifo da fonte.
  # @param font [Font] Fonte.
  # @param scale_factor [Float] Fator de escala.
  # @param codepoint [String] Caractere do texto.
  # @return [Float] Largura do glifo da fonte.
  def calculate_glyph_width(font, scale_factor, codepoint)
    index = get_glyph_index(font, codepoint.ord)
    # Retorna um membro da array em C usando ponteiro, para acessá-lo, pois
    # glyphs da FFI:Struct Font não retorna array, mas apenas ponteiro.
    glyph_info = GlyphInfo.new(font.glyphs + (index * GlyphInfo.size))

    if glyph_info.advance_x.zero?
      # Retorna um membro da array em C usando ponteiro, para
      # acessá-lo, pois rectangle da FFI:Struct Font não retorna
      # array, mas apenas ponteiro.
      r = Rectangle.new(font.recs + (index * Rectangle.size))
      r.width * scale_factor
    else
      glyph_info.advance_x * scale_factor
    end
  end

  # Muda o estado e mede quanto do texto pode ser desenhado.
  # @param text [String] Texto.
  # @param rec [Rectangle] Retângulo.
  # @param state [Integer] Estado: State::Measure ou State::Draw.
  # @param text_offset_x [Integer] Deslocamento x do texto.
  # @param start_line [Integer] Valor do início da linha.
  # @param end_line [Integer] Valor do fim da linha.
  # @param codepoint [String] Caractere do texto.
  # @param glyph_width [Float] Largura do glifo da fonte.
  # @param i [Integer] Índice do texto.
  # @return [state, end_line] [Array<Integer, Integer>] estado e valor do fim da linha.
  def update_measure_state(text,
                           rec,
                           state,
                           text_offset_x,
                           start_line,
                           end_line,
                           codepoint,
                           glyph_width,
                           i)
    end_line = i if [' ', "\t", "\n"].include?(codepoint)

    if text_offset_x + glyph_width > rec.width
      end_line = i if end_line < 1
      end_line -= 1 if i == end_line
      end_line = i - 1 if start_line + 1 == end_line
      state = State::Draw
    elsif i + 1 == text.size
      end_line = i
      state = State::Draw
    elsif codepoint == "\n"
      state = State::Draw
    end

    [state, end_line]
  end

  # Desenha caractere do texto.
  # @param font [Font] Fonte.
  # @param font_size [Float] Tamanho da fonte.
  # @param scale_factor [Float] Fator de escala.
  # @param rec [Rectangle] Retângulo.
  # @param tint [Color] Cor do texto não selecionado.
  # @param select_start [Integer] Valor do ínicio do texto selecionado.
  # @param select_length [Integer] Valor do tamanho do texto selecionado.
  # @param select_tint [Color] Cor do texto selecionado.
  # @param select_back_tint [Color] Cor do fundo da seleção.
  # @param text_offset_x [Integer] Deslocamento x do texto.
  # @param text_offset_y [Integer] Deslocamento y do texto.
  # @param codepoint [String] Caractere do texto.
  # @param glyph_width [Float] Largura do glifo da fonte.
  # @param k [Integer] ...
  def draw_text_character(font,
                          font_size,
                          scale_factor,
                          rec,
                          tint,
                          select_start,
                          select_length,
                          select_tint,
                          select_back_tint,
                          text_offset_x,
                          text_offset_y,
                          codepoint,
                          glyph_width,
                          k)
    glyph_selected = false

    if select_start >= 0 && k >= select_start && k < select_start + select_length
      # Evita que o DrawRectangleRec em C seja chamado se não for para
      # desenhar um retângulo atrás do texto selecionável.
      unless select_back_tint == BLANK
        r = Rectangle.new(
          rec.x + text_offset_x - 1,
          rec.y + text_offset_y,
          glyph_width,
          font.base_size * scale_factor
        )
        draw_rectangle_rec(r, select_back_tint)
      end
      glyph_selected = true
    end
    return if [' ', "\t"].include?(codepoint)

    v = Vector2.new(rec.x + text_offset_x, rec.y + text_offset_y)
    draw_text_codepoint(
      font,
      codepoint.ord,
      v,
      font_size,
      glyph_selected ? select_tint : tint
    )
  end
end
