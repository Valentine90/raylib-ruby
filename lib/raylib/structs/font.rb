# frozen_string_literal: true

module Raylib
  # Textura da fonte e dados da matriz GlyphInfo.
  class Font < FFI::Struct
    layout(
      :base_size, :int,
      :glyph_count, :int,
      :glyph_padding, :int,
      :texture, Texture2D.by_value,
      :recs, :pointer,
      :glyphs, :pointer
    )

    # Controla o tamanho base (altura padrão dos caracteres).
    # @return [Integer] Tamanho base.
    ray_attr_reader :base_size

    # Controla os retângulos em textura para os glifos.
    # @return [Pointer] Retângulos em textura para os glifos.
    ray_attr_reader :recs

    # Controla os dados de informações de glifos.
    # @return [Pointer] Dados de informações de glifos.
    ray_attr_reader :glyphs
  end
end
