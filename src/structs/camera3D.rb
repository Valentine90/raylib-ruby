module Raylib
  class Camera3D < FFI::Struct
    layout(
      :position, Vector3.by_value,
      :target, Vector3.by_value,
      :up, Vector3.by_value,
      :fovy, :float,
      :projection, :int
    )

    def initialize(position, target, up, fovy, projection)
      self.position = position
      self.target = target
      self.up = up
      self.fovy = fovy
      self.projection = projection
    end

    struct_attr_writer :position, :target, :up, :fovy, :projection
  end

  Camera = Camera3D
end
