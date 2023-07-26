RubyInstaller::Runtime.add_dll_directory(Dir.pwd)

require_relative 'ffi'
require_relative 'structs'
require_relative 'constants'
require_relative 'craylib'
require_relative 'word_wrap'

include Raylib
