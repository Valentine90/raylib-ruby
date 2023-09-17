# frozen_string_literal: true

# Texturas e imagens.
module Raylib
  ray_attach_function :LoadImage, [:string], Image.by_value
  ray_attach_function :LoadImageAnim, %i[string pointer], Image.by_value
  ray_attach_function :UnloadImage, [Image.by_value], :void

  ray_attach_function :LoadTexture, [:string], Texture2D.by_value
  ray_attach_function :LoadTextureFromImage, [Image.by_value], Texture2D.by_value
  ray_attach_function :UnloadTexture, [Texture2D.by_value], :void
  ray_attach_function :UpdateTexture, [Texture2D.by_value, :pointer], :void

  ray_attach_function :DrawTexture, [Texture2D.by_value, :int, :int, Color.by_value], :void
  ray_attach_function :DrawTextureEx, [Texture2D.by_value, Vector2.by_value, :float, :float, Color.by_value], :void
  args = [Texture2D.by_value, Rectangle.by_value, Vector2.by_value, Color.by_value]
  ray_attach_function :DrawTextureRec, args, :void

  ray_attach_function :Fade, [Color.by_value, :float], Color.by_value
end
