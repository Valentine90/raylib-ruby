module Raylib
  class Vector3 < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :z, :float
    )

    def initialize(x = 0.0, y = 0.0, z = 0.0)
      self.x = x
      self.y = y
      self.z = z
    end

    struct_attr_accessor :x, :y, :z
  end
end
