# frozen_string_literal: true

module Raylib
  # Informações de glifos de caracteres de fonte.
  class GlyphInfo < FFI::Struct
    layout(
      :value, :int,
      :offset_x, :int,
      :offset_y, :int,
      :advance_x, :int,
      :image, Image.by_value
    )

    # Controla a posição X de avanço do personagem.
    # @return [Integer] Posição X de avanço do personagem.
    ray_attr_reader :advance_x
  end
end
