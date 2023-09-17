# frozen_string_literal: true

module Raylib
  # Fluxo de áudio personalizado.
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
