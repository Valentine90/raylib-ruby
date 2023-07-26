module Raylib
  class Camera2D < FFI::Struct
    layout(
      :offset, Vector2.by_value,
      :target, Vector2.by_value,
      :rotation, :float,
      :zoom, :float
    )

    def initialize(offset, target, rotation = 0.0, zoom = 1.0)
      self.offset = offset
      self.target = target
      self.rotation = rotation
      self.zoom = zoom
    end

    struct_attr_writer :offset
    struct_attr_writer :target
    struct_attr_writer :rotation
    struct_attr_accessor :zoom
  end
end
