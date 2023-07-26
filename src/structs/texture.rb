module Raylib
  class Texture < FFI::Struct
    layout(
      :id, :uint,
      :width, :int,
      :height, :int,
      :mipmaps, :int,
      :format, :int
    )

    struct_attr_reader :width, :height
  end

  Texture2D = Texture
end
