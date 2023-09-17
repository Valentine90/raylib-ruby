# frozen_string_literal: true

# Texto.
module Raylib
  # Carrega a fonte, inclusive em formato png.
  ray_attach_function :LoadFont, [:string], Font.by_value
  # Carrega a fonte, assim como o LoadFont padrão, mas com parâmetros estendidos,
  # possibilitando a alteração do glyphCount, para o desenho de acentos.
  ray_attach_function :LoadFontEx, %i[string int int int], Font.by_value
  ray_attach_function :UnloadFont, [Font.by_value], :void

  # Desenha o FPS, porém com a fonte padrão do raylib.
  ray_attach_function :DrawFPS, %i[int int], :void
  # Desenha o texto, porém com a fonte padrão do raylib.
  ray_attach_function :DrawText, [:string, :int, :int, :int, Color.by_value], :void
  # Desenha o texto, assim como o DrawText padrão, mas com fonte personalizada.
  args = [Font.by_value, :string, Vector2.by_value, :float, :float, Color.by_value]
  ray_attach_function :DrawTextEx, args, :void
  args = [Font.by_value, :int, Vector2.by_value, :float, Color.by_value]
  ray_attach_function :DrawTextCodepoint, args, :void

  ray_attach_function :MeasureTextEx, [Font.by_value, :string, :float, :float], Vector2.by_value
  ray_attach_function :GetGlyphIndex, [Font.by_value, :int], :int
end
