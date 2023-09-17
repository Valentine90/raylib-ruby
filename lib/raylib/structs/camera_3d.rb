# frozen_string_literal: true

module Raylib
  # Define posição/orientação no espaço 3D.
  class Camera3D < FFI::Struct
    layout(
      :position, Vector3.by_value,
      :target, Vector3.by_value,
      :up, Vector3.by_value,
      :fovy, :float,
      :projection, :int
    )

    # Cria uma câmera 3D.
    # @param position [Vector3] Posição.
    # @param target [Vector3] Alvo que olha.
    # @param up [Vector3] Vetor para cima (rotação sobre seu eixo).
    # @param fovy [Float] Abertura do campo de visão em Y (graus) em
    #   perspectiva, usada como largura próxima ao plano em ortografia.
    # @param projection [Integer] Projeção: CameraProjection::Perspective
    #   ou CameraProjection::Orthographic.
    def initialize(position, target, up, fovy, projection)
      self.position = position
      self.target = target
      self.up = up
      self.fovy = fovy
      self.projection = projection
      super()
    end

    # Controla a posição.
    # @return [Vector3] Posição.
    ray_attr_writer :position

    # Controla o alvo que olha.
    # @return [Vector3] Alvo que olha.
    ray_attr_writer :target

    # Controla o vetor para cima (rotação sobre seu eixo).
    # @return [Vector3] Vetor para cima.
    ray_attr_writer :up

    # Controla a abertura do campo de visão em Y (em graus) em perspectiva,
    #   usada como largura próxima ao plano em ortografia.
    # @return [Float] Abertura do campo de visão em Y em perspectiva.
    ray_attr_writer :fovy

    # Controla a projeção: CameraProjection::Perspective
    #   ou CameraProjection::Orthographic.
    # @return [Integer] Projeção.
    ray_attr_writer :projection
  end

  Camera = Camera3D
end
