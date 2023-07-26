module Raylib
  MEASURE_STATE = 0
  DRAW_STATE = 1

  def draw_text_boxed(font, text, rec, font_size, spacing, tint)
    draw_text_boxed_selectable(font, text, rec, font_size, spacing, tint, 0, 0, WHITE, WHITE)
  end
  
  def draw_text_boxed_selectable(font, text, rec, font_size, spacing, tint, select_start, select_length, select_tint, select_back_tint)  
    scale_factor = font_size / font.base_size.to_f
    state = MEASURE_STATE
    text_offset_x = 0.0
    text_offset_y = 0.0
    start_line = -1
    end_line = -1
    lastk = -1
  
    i = 0
    k = 0
    while i < text.size
      codepoint_byte_count = 1
      codepoint = text[i]
      index = get_glyph_index(font, codepoint.ord)
  
      glyph_width = 0.0
      unless codepoint == "\n"
        # Retorna um membro da array em C usando ponteiro, para acessá-lo, pois
        #glyphs da FFI:Struct Font não retorna array, mas apenas ponteiro
        glyph_info = GlyphInfo.new(font.glyphs + index * GlyphInfo.size)
        glyph_width = if glyph_info.advance_x == 0
                        # Retorna um membro da array em C usando ponteiro, para
                        #acessá-lo, pois rectangle da FFI:Struct Font não retorna
                        #array, mas apenas ponteiro
                        r = Rectangle.new(font.recs + index * Rectangle.size)
                        r.width * scale_factor
                      else
                        glyph_info.advance_x * scale_factor
                      end
        glyph_width += spacing if i + 1 < text.size
      end
  
      if state == MEASURE_STATE
        end_line = i if codepoint == ' ' || codepoint == "\t" || codepoint == "\n"
    
        if text_offset_x + glyph_width > rec.width
          end_line = end_line < 1 ? i : end_line
          end_line -= codepoint_byte_count if i == end_line
          end_line = i - codepoint_byte_count if start_line + codepoint_byte_count == end_line
          state = DRAW_STATE
        elsif i + 1 == text.size
          end_line = i
          state = DRAW_STATE
        elsif codepoint == "\n"
          state = DRAW_STATE
        end
  
        if state == DRAW_STATE
          text_offset_x = 0
          i = start_line
          glyph_width = 0
          tmp = lastk
          lastk = k - 1
          k = tmp
        end
      else
        unless codepoint == "\n"
          break if text_offset_y + font.base_size * scale_factor > rec.height
  
          glyph_selected = false
          if select_start >= 0 && k >= select_start && k < select_start + select_length
            r = Rectangle.new(rec.x + text_offset_x - 1, rec.y + text_offset_y, glyph_width, font.base_size * scale_factor)
            draw_rectangle_rec(r, select_back_tint)
            glyph_selected = true
          end
  
          if codepoint != ' ' && codepoint != "\t"
            v = Vector2.new(rec.x + text_offset_x, rec.y + text_offset_y)
            draw_text_codepoint(font, codepoint.ord, v, font_size, glyph_selected ? select_tint : tint)
          end
        end
  
        if i == end_line
          text_offset_y += (font.base_size + (font.base_size / 2)) * scale_factor
          text_offset_x = 0
          start_line = end_line
          end_line = -1
          glyph_width = 0
          select_start += lastk - k
          k = lastk
          state = MEASURE_STATE
        end
      end

      text_offset_x += glyph_width if text_offset_x != 0 || codepoint != ' '
  
      i += 1
      k += 1
    end
  end
end
