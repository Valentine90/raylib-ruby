# frozen_string_literal: true

# Núcleo.
module Raylib
  ray_attach_function :InitWindow, %i[int int string], :void
  ray_attach_function :WindowShouldClose, [], :bool
  ray_attach_function :CloseWindow, [], :void
  ray_attach_function :IsWindowFullscreen, [], :bool
  ray_attach_function :ToggleFullscreen, [], :void
  ray_attach_function :SetWindowIcon, [Image.by_value], :void
  ray_attach_function :SetWindowTitle, [:string], :void
  ray_attach_function :SetWindowPosition, %i[int int], :void
  ray_attach_function :SetWindowSize, %i[int int], :void
  ray_attach_function :GetScreenWidth, [], :int
  ray_attach_function :GetScreenHeight, [], :int

  ray_attach_function :ShowCursor, [], :void
  ray_attach_function :HideCursor, [], :void

  ray_attach_function :ClearBackground, [Color.by_value], :void
  ray_attach_function :BeginDrawing, [], :void
  ray_attach_function :EndDrawing, [], :void
  ray_attach_function :BeginMode2D, [Camera2D.by_value], :void
  ray_attach_function :EndMode2D, [], :void
  ray_attach_function :BeginMode3D, [Camera3D.by_value], :void
  ray_attach_function :EndMode3D, [], :void

  ray_attach_function :SetTargetFPS, [:int], :void
  # Obtém o FPS para desenhá-lo usando draw_text_ex, uma vez que
  # o DrawFPS desenha o FPS usando a fonte padrão do Raylib.
  ray_attach_function :GetFPS, [], :int

  ray_attach_function :TakeScreenshot, [:string], :void
  ray_attach_function :OpenURL, [:string], :void

  ray_attach_function :IsKeyPressed, [:int], :bool
  ray_attach_function :IsKeyDown, [:int], :bool
  ray_attach_function :IsKeyReleased, [:int], :bool
  ray_attach_function :GetCharPressed, [], :int

  ray_attach_function :IsMouseButtonPressed, [:int], :bool
  ray_attach_function :IsMouseButtonDown, [:int], :bool
  ray_attach_function :IsMouseButtonReleased, [:int], :bool
  ray_attach_function :IsMouseButtonUp, [:int], :bool
  ray_attach_function :GetMouseX, [], :int
  ray_attach_function :GetMouseY, [], :int
  ray_attach_function :GetMousePosition, [], Vector2.by_value
  # Obtém o movimento da rolagem do mouse.
  ray_attach_function :GetMouseWheelMove, [], :float

  ray_attach_function :UpdateCamera, [Camera3D.by_value, :int], :void

  # Cria um bloco para evitar indentação arbitrária, a utilização manual
  # do begin e end, bem como aproximar o código do estilo Ruby, sem excluir
  # a possibilidade de utilização do begin_drawing e end_drawing diretamente.
  def drawing
    begin_drawing
    yield
    end_drawing
  end

  # Cria um bloco para evitar indentação arbitrária, a utilização manual
  # do begin e end, bem como aproximar o código do estilo Ruby, sem excluir
  # a possibilidade de utilização do begin_mode2d e end_mode2d diretamente.
  def mode_2d(camera)
    begin_mode_2d(camera)
    yield
    end_mode_2d
  end

  # Cria um bloco para evitar indentação arbitrária, a utilização manual
  # do begin e end, bem como aproximar o código do estilo Ruby, sem excluir
  # a possibilidade de utilização do begin_mode3d e end_mode3d diretamente.
  def mode_3d(camera)
    begin_mode_3d(camera)
    yield
    end_mode_3d
  end
end
