require_relative '../src/raylib'

MAX_COLUMNS = 20

screen_width = 800
screen_height = 450

init_window(screen_width, screen_height, '3D camera')

position = Vector3.new(4.0, 2.0, 4.0)
target = Vector3.new(0.0, 1.8, 0.0)
up = Vector3.new(0.0, 1.0, 0.0)
fovy = 60.0
projection = CAMERA_PERSPECTIVE
camera = Camera3D.new(position, target, up, fovy, projection)
#texture = load_texture('tests/resources/box.png')

heights = []
positions = []
colors = []
MAX_COLUMNS.times do |i|
  heights << rand(1..12).to_f
  positions << Vector3.new(rand(-15..15).to_f, heights[i] / 2.0, rand(-15..15).to_f)
  colors << Color.new(rand(20..255), rand(10..55), 30)
end

set_camera_mode(camera, CAMERA_FIRST_PERSON)

set_target_fps(60)

until window_should_close
  update_camera(camera)

  begin_drawing

    clear_background(BLACK)

    begin_mode_3d(camera)

      draw_plane(Vector3.new, Vector2.new(32.0, 32.0), LIGHT_GRAY)
      draw_cube(Vector3.new(-16.0, 2.5), 1.0, 5.0, 32.0, BLUE)
      draw_cube(Vector3.new(16.0, 2.5), 1.0, 5.0, 32.0, LIME)
      draw_cube(Vector3.new(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, GOLD)
      MAX_COLUMNS.times do |i|
        #draw_cube_texture(texture, positions[i], 2.0, heights[i], 2.0, WHITE)
        draw_cube(positions[i], 2.0, heights[i], 2.0, colors[i])
        draw_cube_wires(positions[i], 2.0, heights[i], 2.0, MAROON)
      end

    end_mode_3d

    draw_fps(10, 10)
    
  end_drawing
end

close_window
