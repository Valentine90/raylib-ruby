# frozen_string_literal: true

# Modo da câmera 3D.
module Raylib
  CameraMode = ray_enum %w[
    Custom
    Free
    Orbital
    First_Person
    Third_Person
  ]
end
