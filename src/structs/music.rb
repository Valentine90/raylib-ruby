module Raylib
  class Music < FFI::Struct
    layout(
      :stream, AudioStream.by_value,
      :frame_count, :uint,
      :looping, :bool,
      :ctx_type, :int,
      :ctx_data, :pointer
    )

    struct_attr_writer :looping
  end
end
