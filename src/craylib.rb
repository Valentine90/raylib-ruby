module Raylib
  extend FFI::Library

  ffi_lib 'bin/raylib'

  RAYLIB_VERSION = '4.2'

  core = {
    :InitWindow => [[:int, :int, :string], :void],
    :WindowShouldClose => [[], :bool],
    :CloseWindow => [[], :void],
    :IsWindowFullscreen => [[], :bool],
    :ToggleFullscreen => [[], :void],
    :SetWindowIcon => [[Image.by_value], :void],
    :SetWindowTitle => [[:string], :void],
    :SetWindowPosition => [[:int, :int], :void],
    :SetWindowSize => [[:int, :int], :void],
    :GetScreenWidth => [[], :int],
    :GetScreenHeight => [[], :int],

    :ShowCursor => [[], :void],
    :HideCursor => [[], :void],

    :ClearBackground => [[Color.by_value], :void],
    :BeginDrawing => [[], :void],
    :EndDrawing => [[], :void],
    :BeginMode2D => [[Camera2D.by_value], :void],
    :EndMode2D => [[], :void],
    :BeginMode3D => [[Camera3D.by_value], :void],
    :EndMode3D => [[], :void],
 
    :SetTargetFPS => [[:int], :void],
    # Obtém o FPS para desenhá-lo usando draw_text_ex, uma vez que
    #o DrawFPS desenha o FPS usando a fonte padrão do Raylib
    :GetFPS => [[], :int],

    :TakeScreenshot => [[:string], :void],
    :OpenURL => [[:string], :void],

    :IsKeyPressed => [[:int], :bool],
    :IsKeyDown => [[:int], :bool],
    :IsKeyReleased => [[:int], :bool],
    :GetCharPressed => [[], :int],

    :IsMouseButtonPressed => [[:int], :bool],
    :IsMouseButtonDown => [[:int], :bool],
    :IsMouseButtonReleased => [[:int], :bool],
    :IsMouseButtonUp => [[:int], :bool],
    :GetMouseX => [[], :int],
    :GetMouseY => [[], :int],
    :GetMousePosition => [[Vector2.by_value], :void],
    # Obtém o movimento da rolagem do mouse
    :GetMouseWheelMove => [[], :float],

    :SetCameraMode => [[Camera3D.by_value, :int], :void],
    :UpdateCamera => [[Camera3D.by_value], :void]
  }

  shapes = {
    :DrawPixel => [[:int, :int, Color.by_value], :void],
    :DrawRectangle => [[:int, :int, :int, :int, Color.by_value], :void],
    :DrawLine => [[:int, :int, :int, :int, Color.by_value], :void],
    :DrawRectangleRec => [[Rectangle.by_value, Color.by_value], :void]
  }

  textures = {
    :LoadImage => [[:string], Image.by_value],
    :LoadImageAnim => [[:string, :pointer], Image.by_value],
    :UnloadImage => [[Image.by_value], :void],

    :LoadTexture => [[:string], Texture2D.by_value],
    :LoadTextureFromImage => [[Image.by_value], Texture2D.by_value],
    :UnloadTexture => [[Texture2D.by_value], :void],
    :UpdateTexture => [[Texture2D.by_value, :pointer], :void],

    :DrawTexture => [[Texture2D.by_value, :int, :int, Color.by_value], :void],
    :DrawTextureEx => [[Texture2D.by_value, Vector2.by_value, :float, :float, Color.by_value], :void],
    :DrawTextureRec => [[Texture2D.by_value, Rectangle.by_value, Vector2.by_value, Color.by_value], :void],
    :DrawTextureQuad => [[Texture2D.by_value, Vector2.by_value, Vector2.by_value, Rectangle.by_value, Color.by_value], :void],

    :Fade => [[Color.by_value, :float], Color.by_value]
  }

  text = {
    # Carrega a fonte, inclusive em formato png
    :LoadFont => [[:string], Font.by_value],
    # Carrega a fonte, assim como o LoadFont padrão, mas com parâmetros estendidos,
    #possibilitando a alteração do glyphCount, para o desenho de acentos
    :LoadFontEx => [[:string, :int, :int, :int], Font.by_value],
    :UnloadFont => [[Font.by_value], :void],

    # Desenha o FPS, porém com a fonte padrão do raylib
    :DrawFPS => [[:int, :int], :void],
    # Desenha o texto, porém com a fonte padrão do raylib
    :DrawText => [[:string, :int, :int, :int, Color.by_value], :void],
    # Desenha o texto, assim como o DrawText padrão, mas com fonte personalizada
    :DrawTextEx => [[Font.by_value, :string, Vector2.by_value, :float, :float, Color.by_value], :void],
    :DrawTextCodepoint => [[Font.by_value, :int, Vector2.by_value, :float, Color.by_value], :void],
    :MeasureTextEx => [[Font.by_value, :string, :float, :float], Vector2.by_value],
    :GetGlyphIndex => [[Font.by_value, :int], :int]
  }

  models3D = {
    :DrawCube => [[Vector3.by_value, :float, :float, :float, Color.by_value], :void],
    :DrawCubeWires => [[Vector3.by_value, :float, :float, :float, Color.by_value], :void],
    :DrawCubeTexture => [[Texture2D.by_value, Vector3.by_value, :float, :float, :float, Color.by_value], :void],
    :DrawPlane => [[Vector3.by_value, Vector2.by_value, Color.by_value], :void]
  }

  audio = {
    :InitAudioDevice => [[], :void],
    :CloseAudioDevice => [[], :void],
    :UnloadSound => [[Sound.by_value], :void],
    :LoadSound => [[:string], Sound.by_value],
    :PlaySound => [[Sound.by_value], :void],
    :StopSound => [[Sound.by_value], :void],
    :PauseSound => [[Sound.by_value], :void],

    :LoadMusicStream => [[:string], Music.by_value],
    :UnloadMusicStream => [[Music.by_value], :void],
    :PlayMusicStream => [[Music.by_value], :void],
    :IsMusicStreamPlaying => [[Music.by_value], :bool],
    :UpdateMusicStream => [[Music.by_value], :bool],
    :StopMusicStream => [[Music.by_value], :void],
    :PauseMusicStream => [[Music.by_value], :void],
    :ResumeMusicStream => [[Music.by_value], :void],
    :SetMusicVolume => [[Music.by_value, :float], :void],
    :SetMusicPitch => [[Music.by_value, :float], :void]
  }

  [core, shapes, textures, text, models3D, audio].each do |functions|
    functions.each do |c_func, value|
      # Substitui GetTouchX por get_touch_x, ImageRotateCW por image_rotate_cw,
      #GetFPS por get_fps, BeginMode2D por begin_mode_2d, DrawTextureNPatch por
      #draw_texture_n_patch, CodepointToUTF8 por codepoint_to_utf8 etc.
      ruby_func = c_func.to_s.split(/([A-Z]{2,}8?)$|([2-3]D)|(?=[A-Z])/).join('_').downcase
      attach_function ruby_func, c_func, value[0], value[1]
    end
  end
end
