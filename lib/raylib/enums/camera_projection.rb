# frozen_string_literal: true

# Projeção da câmera 3D.
module Raylib
  CameraProjection = ray_enum %w[
    Perspective
    Orthographic
  ]
end
