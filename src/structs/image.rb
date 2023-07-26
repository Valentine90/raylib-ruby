module Raylib
  class Image < FFI::Struct
    layout(
      :data, :pointer,
      :width, :int,
      :height, :int,
      :mipmaps, :int,
      :format, :int
    )

    struct_attr_reader :data, :width, :height
  end
end
