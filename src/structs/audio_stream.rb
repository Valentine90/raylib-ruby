module Raylib
  class AudioStream < FFI::Struct
    layout(
      :buffer, :pointer,
      :processor, :pointer,
      :sample_rate, :uint,
      :sample_size, :uint,
      :channels, :uint
    )
  end
end
