module Raylib
  class Rectangle < FFI::Struct
    layout(
      :x, :float,
      :y, :float,
      :width, :float,
      :height, :float
    )

    def initialize(x = 0.0, y = 0.0, width = 0.0, height = 0.0)
      # 
      if x.is_a?(Numeric)
        self.x = x
        self.y = y
        self.width = width
        self.height = height
      else
        pointer = x
        super(pointer)
      end
    end

    struct_attr_accessor :x, :y, :width, :height
  end
end
