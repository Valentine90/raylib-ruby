module Raylib
  class Color < FFI::Struct
    layout(
      :r, :uchar,
      :g, :uchar,
      :b, :uchar,
      :a, :uchar
    )

    def initialize(r = 0, g = 0, b = 0, a = 255)
      # Se Color não estiver sendo criado como tipo
      #de saída de alguma função do craylib
      if r.is_a?(Numeric)
        self.r = r
        self.g = g
        self.b = b
        self.a = a
      else
        pointer = r
        super(pointer)
      end
    end

    struct_attr_accessor :r, :g, :b, :a
  end
end
