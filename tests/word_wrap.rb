require_relative '../src/raylib'

screen_width = 800
screen_height = 450

init_window(screen_width, screen_height, 'Draw text inside a rectangle')

text = "Text cannot escape\tthis container\t...word wrap also works when active so here's \
a long text for testing.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \
tempor incididunt ut labore et dolore magna aliqua. Nec ullamcorper sit amet risus nullam eget felis eget."
container = Rectangle.new(25.0, 25.0, screen_width - 50.0, screen_height - 250.0)
rec = Rectangle.new(container.x + 4, container.y + 4, container.width - 4, container.height - 4)
font = load_font_ex('tests/resources/fonts/tahoma.ttf', 20, 0, 250)
border_color = MAROON

set_target_fps(60)

until window_should_close
  if is_key_pressed(KEY_SPACE)
    border_color = fade(MAROON, 0.4)
  else
    border_color = MAROON
  end

  begin_drawing

    clear_background(BLACK)
    
    draw_rectangle_rec(container, border_color)
    draw_text_boxed(font, text, rec, 20.0, 2.0, WHITE)
  
  end_drawing
end

close_window
