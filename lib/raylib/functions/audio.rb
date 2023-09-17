# frozen_string_literal: true

# Aúdio.
module Raylib
  ray_attach_function :InitAudioDevice, [], :void
  ray_attach_function :CloseAudioDevice, [], :void

  ray_attach_function :LoadSound, [:string], Sound.by_value
  ray_attach_function :UnloadSound, [Sound.by_value], :void

  ray_attach_function :PlaySound, [Sound.by_value], :void
  ray_attach_function :StopSound, [Sound.by_value], :void
  ray_attach_function :PauseSound, [Sound.by_value], :void

  ray_attach_function :LoadMusicStream, [:string], Music.by_value
  ray_attach_function :UnloadMusicStream, [Music.by_value], :void
  ray_attach_function :PlayMusicStream, [Music.by_value], :void
  ray_attach_function :IsMusicStreamPlaying, [Music.by_value], :bool
  ray_attach_function :UpdateMusicStream, [Music.by_value], :void
  ray_attach_function :StopMusicStream, [Music.by_value], :void
  ray_attach_function :PauseMusicStream, [Music.by_value], :void
  ray_attach_function :ResumeMusicStream, [Music.by_value], :void
  ray_attach_function :SetMusicVolume, [Music.by_value, :float], :void
  ray_attach_function :SetMusicPitch, [Music.by_value, :float], :void
end
