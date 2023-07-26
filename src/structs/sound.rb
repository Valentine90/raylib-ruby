module Raylib
  class Sound < FFI::Struct
    layout(
      :stream, AudioStream.by_value,
      :frame_count, :uint
    )
  end
end
