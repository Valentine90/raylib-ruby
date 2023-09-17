# frozen_string_literal: true

module Raylib
  # Dados tex armazenados na memória GPU (VRAM).
  class Texture < FFI::Struct
    layout(
      :id, :uint,
      :width, :int,
      :height, :int,
      :mipmaps, :int,
      :format, :int
    )

    # Controla a largura.
    # @return [Integer] Largura.
    ray_attr_reader :width

    # Controla a altura.
    # @return [Integer] Altura.
    ray_attr_reader :height
  end

  Texture2D = Texture
end
