# frozen_string_literal: true

# Modelos 3D.
module Raylib
  ray_attach_function :DrawCube, [Vector3.by_value, :float, :float, :float, Color.by_value], :void
  args = [Vector3.by_value, :float, :float, :float, Color.by_value]
  ray_attach_function :DrawCubeWires, args, :void
  ray_attach_function :DrawPlane, [Vector3.by_value, Vector2.by_value, Color.by_value], :void
end
