require_relative '../src/raylib'

screen_width = 800
screen_height = 450

init_window(screen_width, screen_height, '2D camera')

player = Rectangle.new(400.0, 280.0, 40.0, 40.0)
target = Vector2.new(player.x + 20.0, player.y + 20.0)
offset = Vector2.new(screen_width / 2.0, screen_height / 2.0)
camera = Camera2D.new(offset, target)

set_target_fps(60)

until window_should_close
  if is_key_down(KEY_RIGHT)
    player.x += 2
  elsif is_key_down(KEY_LEFT)
    player.x -= 2
  end

  camera.target = Vector2.new(player.x + 20, player.y + 20)
  camera.zoom += get_mouse_wheel_move * 0.05

  begin_drawing

    clear_background(BLACK)

    begin_mode_2d(camera)
    
      draw_rectangle_rec(player, RED)

    end_mode_2d

  end_drawing
end

close_window
