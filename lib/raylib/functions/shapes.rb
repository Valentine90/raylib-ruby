# frozen_string_literal: true

# Formas.
module Raylib
  ray_attach_function :DrawPixel, [:int, :int, Color.by_value], :void
  ray_attach_function :DrawLine, [:int, :int, :int, :int, Color.by_value], :void
  ray_attach_function :DrawRectangle, [:int, :int, :int, :int, Color.by_value], :void
  ray_attach_function :DrawRectangleRec, [Rectangle.by_value, Color.by_value], :void

  ray_attach_function :CheckCollisionPointRec, [Vector2.by_value, Rectangle.by_value], :bool
end
