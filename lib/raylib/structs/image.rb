# frozen_string_literal: true

module Raylib
  # Dados de pixel armazenados na memória da CPU (RAM).
  class Image < FFI::Struct
    layout(
      :data, :pointer,
      :width, :int,
      :height, :int,
      :mipmaps, :int,
      :format, :int
    )

    # Controla os dados brutos.
    # @return [Pointer] Dados brutos.
    ray_attr_reader :data

    # Controla a largura.
    # @return [Integer] Largura.
    ray_attr_reader :width

    # Controla a altura.
    # @return [Integer] Altura.
    ray_attr_reader :height
  end
end
