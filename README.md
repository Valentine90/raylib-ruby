<p><img src="https://upload.wikimedia.org/wikipedia/commons/f/f4/Raylib_logo.png" width="160" height="160"></p>

# About
Ruby bindings for [Raylib](https://www.raylib.com/).

Notice: This project is experimental.

![Status](https://img.shields.io/badge/status-in_development-green.svg)
[![PyPi license](https://badgen.net/pypi/license/pip/)]([https://pypi.org/project/pip/](https://github.com/Valentine90/raylib-ruby/blob/main/licence))

# Features
- [Raylib v4.5](https://github.com/raysan5/raylib/releases/tag/4.5.0)
- Based on [FFI](https://github.com/ffi/ffi)
- Supported platforms:
  * Windows (x64 and x86)
  * MacOS
  * Linux (x64)

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
