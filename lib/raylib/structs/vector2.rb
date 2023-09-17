# frozen_string_literal: true

module Raylib
  # Vetor com 2 componentes (x e y).
  class Vector2 < FFI::Struct
    layout(
      :x, :float,
      :y, :float
    )

    # Cria um vetor com 2 componentes.
    # @param x [Float] Componente x.
    # @param y [Float] Componente y.
    def initialize(x = 0.0, y = 0.0)
      # Se Vetor2 não estiver sendo inicializado como tipo
      # de saída de alguma função de text ou core.
      if x.is_a?(Numeric)
        self.x = x
        self.y = y
      else
        pointer = x
        super(pointer)
      end
    end

    # Controla o componente x.
    # @return [Float] Componente x.
    ray_attr_accessor :x

    # Controla o componente y.
    # @return [Float] Componente y.
    ray_attr_accessor :y
  end
end
