# frozen_string_literal: true

module Raylib
  # Retângulo.
  class Rectangle < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :width, :float,
      :height, :float
    )

    # Cria um retângulo.
    # @param x [Float] Posição do canto superior esquerdo x.
    # @param y [Float] Posição do canto superior esquerdo y.
    # @param width [Float] Largura.
    # @param height [Float] Altura.
    def initialize(x, y = 0.0, width = 0.0, height = 0.0)
      # Se Rectangle não estiver sendo inicializado com um
      # parâmetro do tipo ponteiro, como no word wrap.
      if x.is_a?(Numeric)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
      else
        pointer = x
        super(pointer)
      end
    end

    # Controla a posição do canto superior esquerdo x.
    # @return [Float] Posição do canto superior esquerdo x.
    ray_attr_accessor :x

    # Controla a posição do canto superior esquerdo y.
    # @return [Float] Posição do canto superior esquerdo y.
    ray_attr_accessor :y

    # Controla a largura.
    # @return [Float] Largura.
    ray_attr_accessor :width

    # Controla a altura.
    # @return [Float] Altura.
    ray_attr_accessor :height
  end
end
