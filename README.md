<p><img src="https://upload.wikimedia.org/wikipedia/commons/f/f4/Raylib_logo.png" width="160" height="160"></p>

# About
[Raylib](https://www.raylib.com/) wrapper for Ruby.

Notice: This project is experimental.

# Prerequisites
- [Ruby interpreter](https://www.ruby-lang.org/pt/downloads/)
- Gem [FFI](https://github.com/ffi/ffi)

#  Example
```Ruby
require_relative 'lib/raylib'

init_window(800, 450, 'raylib [core] example - basic window')

until window_should_close
  drawing do
    clear_background(RAY_WHITE)

    draw_text('Congrats! You created your first window!', 190, 200, 20, LIGHT_GRAY)
  end
end

close_window
```
