require_relative '../src/raylib'

screen_width = 800
screen_height = 600

init_window(screen_width, screen_height, 'Basic window')

texture = load_texture('tests/resources/bat.png')

image = load_image('tests/resources/icon.png')
set_window_icon(image)
unload_image(image)

font = load_font_ex('tests/resources/fonts/tahoma.ttf', 20, 0, 250)
font_size = font.base_size.to_f
text_size = measure_text_ex(font, 'Congrats! You created your first window!', font_size, 1.0)

position1 = Vector2.new(220.0, 220.0)
position2 = Vector2.new(260.0, 220.0)
position3 = Vector2.new(5.0, 5.0)
offset = Vector2.new(0.0, 0.0)
rec = Rectangle.new(0.0, 0.0, 32.0, 32.0)

init_audio_device
sound = load_sound('tests/resources/audio/cursor.wav')#zintro.ogg')#country.mp3')
play_sound(sound)
music = load_music_stream('tests/resources/audio/country.mp3')
play_music_stream(music)
set_music_volume(music, 0.1)

anim_frames_buff = FFI::MemoryPointer.new(:int, 1)
im_scarfy_anim = load_image_anim('tests/resources/scarfy_run.gif', anim_frames_buff)
tex_scarfy_anim = load_texture_from_image(im_scarfy_anim)

set_target_fps(60)

#take_screenshot('tests/print.png')

#open_url('www.google.com')

frames_counter = 0

until window_should_close
  #update
  frames_counter = frames_counter < 60 ? frames_counter + 1 : 0
  next_frame_data_offset = im_scarfy_anim.width * im_scarfy_anim.height * 4 * rand(3)
  update_texture(tex_scarfy_anim, im_scarfy_anim.data + next_frame_data_offset) if frames_counter == 8
  
  begin_drawing

    #draw
    update_music_stream(music)

    clear_background(BLACK)

    draw_texture(tex_scarfy_anim, 250, 10, WHITE)
    draw_texture(texture, 10, 20, WHITE)
    draw_texture_ex(texture, position1, 45.0, 2.0, WHITE)
    draw_texture_rec(texture, rec, position2, WHITE)
    draw_texture_quad(texture, position1, offset, rec, WHITE)
    draw_text_ex(font, 'Congrats! You created your first window!', position1, font_size, 1.0, LIGHT_GRAY)
    draw_text_ex(font, "#{get_fps} FPS", position3, font_size, 1.0, GREEN)
    draw_rectangle(200, 50, 50, 50, WHITE)
    draw_line(0, 2, 640, 2, WHITE)

  end_drawing
end

unload_texture(texture)
unload_texture(tex_scarfy_anim)
unload_image(im_scarfy_anim)
unload_font(font)
unload_sound(sound)
unload_music_stream(music)

close_audio_device
close_window
