# frozen_string_literal: true

require_relative '../lib/raylib'

MAX_COLUMNS = 20

screen_width = 800
screen_height = 450

init_window(screen_width, screen_height, '3D camera')

position = Vector3.new(0.0, 2.0, 4.0)
target = Vector3.new(0.0, 2.0, 0.0)
up = Vector3.new(0.0, 1.0, 0.0)
fovy = 60.0
projection = CameraProjection::Perspective
camera = Camera3D.new(position, target, up, fovy, projection)

heights = []
positions = []
colors = []
MAX_COLUMNS.times do |i|
  heights << rand(1..12).to_f
  positions << Vector3.new(rand(-15..15).to_f, heights[i] / 2.0, rand(-15..15).to_f)
  colors << Color.new(rand(20..255), rand(10..55), 30)
end

set_target_fps(60)

until window_should_close
  update_camera(camera, CameraMode::First_Person)

  drawing do
    clear_background(BLACK)

    mode_3d(camera) do
      draw_plane(Vector3.new, Vector2.new(32.0, 32.0), LIGHT_GRAY)
      draw_cube(Vector3.new(-16.0, 2.5), 1.0, 5.0, 32.0, BLUE)
      draw_cube(Vector3.new(16.0, 2.5), 1.0, 5.0, 32.0, LIME)
      draw_cube(Vector3.new(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, GOLD)
      MAX_COLUMNS.times do |i|
        draw_cube(positions[i], 2.0, heights[i], 2.0, colors[i])
        draw_cube_wires(positions[i], 2.0, heights[i], 2.0, MAROON)
      end
    end

    draw_fps(10, 10)
  end
end

close_window
