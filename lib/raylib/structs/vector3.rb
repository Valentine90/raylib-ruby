# frozen_string_literal: true

module Raylib
  # Vetor com 3 componentes (x, y e z).
  class Vector3 < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :z, :float
    )

    # Cria um vetor com 3 componentes.
    # @param x [Float] Componente x.
    # @param y [Float] Componente y.
    # @param z [Float] Componente z.
    def initialize(x = 0.0, y = 0.0, z = 0.0)
      self.x = x
      self.y = y
      self.z = z
      super()
    end

    # Controla o componente x.
    # @return [Float] Componente x.
    ray_attr_accessor :x

    # Controla o componente y.
    # @return [Float] Componente y.
    ray_attr_accessor :y

    # Controla o componente z.
    # @return [Float] Componente z.
    ray_attr_accessor :z
  end
end
