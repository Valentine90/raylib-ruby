module Raylib
  class Font < FFI::Struct
    layout(
      :base_size, :int,
      :glyph_count, :int,
      :glyph_padding, :int,
      :texture, Texture2D.by_value,
      :recs, :pointer,
      :glyphs, :pointer
    )

    struct_attr_reader :base_size, :recs, :glyphs
  end
end
