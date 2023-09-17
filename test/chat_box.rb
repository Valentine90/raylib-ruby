# frozen_string_literal: true

require_relative '../lib/raylib'
require_relative 'text_boxed'

screen_width = 1024
screen_height = 608

init_window(screen_width, screen_height, 'Chat box')

resizing = false

min_width = 430.0
min_height = 164.0
max_width = 720.0
max_height = 185.0

window = Rectangle.new(15.0, 431.0, min_width, min_height)
resizer = Rectangle.new(window.x + window.width - 14, window.y + window.height - 14, 14, 14)

last_mouse = Vector2.new
window_color = Color.new(0, 0, 0, 200)
text_options = {
  font_size: 20.0,
  spacing: 2.0,
  select_start: 0,
  select_back_tint: BLANK
}

ChatMessage = Struct.new(:player_name, :name_color, :text, :text_color)
messages = [
  ChatMessage.new('Valentine', YELLOW, 'chsa shhushas aushaus ashausa sahsuas ashaushua sauhsaus ashaushuahsas'),
  ChatMessage.new('Soreto', BLUE, 'ahsa shhushas aushaus ashausa sahsuas ashaushua sauhsaus ashaushuahsas'),
  ChatMessage.new(nil, nil, 'Mensagem de alerta de teste.', RED),
  ChatMessage.new('Kies', WHITE, 'ahsa shhushas aushaus ashausa sahsuas ashaushua sauhsaus ashaushuahsas'),
  ChatMessage.new('Ivo', YELLOW, 'ahsa shhushas aushaus ashausa sahsuas ashaushua sauhsaus ashaushuahsas')
]

font = load_font_ex('test/assets/fonts/tahoma.ttf', 20, 0, 250)

set_target_fps(60)

def draw_message(font, message_rec, text_options, message)
  if message.text_color.nil?
    text_options[:tint] = WHITE
    text_options[:select_length] = "#{message.player_name}:".size
    text_options[:select_tint] = message.name_color
    draw_text_boxed_selectable(font, "#{message.player_name}: #{message.text}", message_rec, text_options)
  else
    text_options[:tint] = message.text_color
    draw_text_boxed(font, message.text, message_rec, text_options)
  end
end

until window_should_close
  mouse = get_mouse_position

  if resizing
    resizing = false if mouse_button_released?(Mouse::Button_Left)

    window.width = (window.width + mouse.x - last_mouse.x).clamp(min_width, max_width)
    window.height = (window.height + mouse.y - last_mouse.y).clamp(min_height, max_height)
  elsif mouse_button_down?(Mouse::Button_Left) && check_collision_point_rec(mouse, resizer)
    resizing = true
  end

  resizer.x = window.x + window.width - 14
  resizer.y = window.y + window.height - 14

  last_mouse = mouse

  drawing do
    clear_background(WHITE)

    draw_rectangle_rec(window, window_color)
    message_rec = Rectangle.new(window.x + 4, window.y + 4, window.width - 4, window.height - 4)
    messages.each { |message| draw_message(font, message_rec, text_options, message) }
    draw_rectangle_rec(resizer, MAROON)
  end
end

unload_font(font)

close_window
