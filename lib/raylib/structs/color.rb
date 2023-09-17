# frozen_string_literal: true

module Raylib
  # Cor.
  class Color < FFI::Struct
    layout(
      :red, :uchar,
      :green, :uchar,
      :blue, :uchar,
      :alpha, :uchar
    )

    # Cria uma cor.
    # @param red [Numeric] Valor vermelho.
    # @param green [Numeric] Valor verde.
    # @param blue [Numeric] Valor azul.
    # @param alpha [Numeric] Valor alfa.
    def initialize(red, green = 0, blue = 0, alpha = 255)
      # Se Color não estiver sendo inicializado como tipo
      # de saída de alguma função de textures.
      if red.is_a?(Numeric)
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
      else
        pointer = red
        super(pointer)
      end
    end

    # Controla o valor vermelho.
    # @return [Numeric] Valor vermelho.
    ray_attr_accessor :red

    # Controla o valor verde.
    # @return [Numeric] Valor verde.
    ray_attr_accessor :green

    # Controla o valor azul.
    # @return [Numeric] Valor azul.
    ray_attr_accessor :blue

    # Controla o valor alfa.
    # @return [Numeric] Valor alfa.
    ray_attr_accessor :alpha
  end
end
