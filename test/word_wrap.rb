# frozen_string_literal: true

require_relative '../lib/raylib'
require_relative 'text_boxed'

screen_width = 800
screen_height = 450

init_window(screen_width, screen_height, 'Draw text inside a rectangle')

text = "Text cannot escape\tthis container\t...word wrap also works when active so here's \
a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \
tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget."
container = Rectangle.new(25.0, 25.0, screen_width - 50.0, screen_height - 250.0)
rec = Rectangle.new(container.x + 4, container.y + 4, container.width - 4, container.height - 4)
font = load_font_ex('test/assets/fonts/tahoma.ttf', 20, 0, 250)
# Instancia a variável apenas uma vez, fora do laço, e não a cada repetição.
container_color = MAROON
text_options = {
  font_size: 20.0,
  spacing: 2.0,
  tint: WHITE
}

set_target_fps(60)

until window_should_close
  container_color = key_pressed?(Key::Space) ? fade(MAROON, 0.4) : MAROON

  drawing do
    clear_background(BLACK)

    draw_rectangle_rec(container, container_color)
    draw_text_boxed(font, text, rec, text_options)
  end
end

unload_font(font)

close_window
