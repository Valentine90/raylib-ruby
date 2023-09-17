# frozen_string_literal: true

module Raylib
  # Define posição/orientação no espaço 2D.
  class Camera2D < FFI::Struct
    layout(
      :offset, Vector2.by_value,
      :target, Vector2.by_value,
      :rotation, :float,
      :zoom, :float
    )

    # Cria uma câmera 2D.
    # @param offset [Vector2] Deslocamento.
    # @param target [Vector2] Alvo (rotação e origem do zoom).
    # @param rotation [Float] Rotação em graus.
    # @param zoom [Float] Zoom.
    def initialize(offset, target, rotation = 0.0, zoom = 1.0)
      self.offset = offset
      self.target = target
      self.rotation = rotation
      self.zoom = zoom
      # Embora a superclasse não precise inicializar seu próprio estado, é
      # uma boa prática chamar o super e faz parte do guia de estilo Ruby.
      super()
    end

    # Controla o deslocamento.
    # @return [Vector2] Deslocamento.
    ray_attr_writer :offset

    # Controla o alvo (rotação e origem do zoom).
    # @return [Vector2] Alvo.
    ray_attr_writer :target

    # Controla a rotação em graus.
    # @return [Float] Rotação.
    ray_attr_writer :rotation

    # Controla o zoom.
    # @return [Float] Zoom.
    ray_attr_accessor :zoom
  end
end
