# frozen_string_literal: true

module Raylib
  # Fluxo de áudio e qualquer coisa com transmissão de mais
  # de 10 segundos.
  class Music < FFI::Struct
    layout(
      :stream, AudioStream.by_value,
      :frame_count, :uint,
      :looping, :bool,
      :ctx_type, :int,
      :ctx_data, :pointer
    )

    # Controla o ciclo.
    # @return [Boolean] Ciclo.
    ray_attr_writer :looping
  end
end
