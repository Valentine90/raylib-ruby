module Raylib
  class GlyphInfo < FFI::Struct
    layout(
      :value, :int,
      :offset_x, :int,
      :offset_y, :int,
      :advance_x, :int,
      :image, Image.by_value
    )

    struct_attr_reader :advance_x
  end
end
