# frozen_string_literal: true

module Raylib
  # Som.
  class Sound < FFI::Struct
    layout(
      :stream, AudioStream.by_value,
      :frame_count, :uint
    )
  end
end
