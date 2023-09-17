# frozen_string_literal: true

require 'ffi'

RubyInstaller::Runtime.add_dll_directory(Dir.pwd)

# Ligações Ruby para Raylib.
#
# Visite o site https://github.com/Valentine90/raylib-ruby
# para mais informações.
#
# Copyright (c) 2023 Valentine.
module Raylib
  extend FFI::Library

  if FFI::Platform.windows?
    arch = FFI::Platform::ADDRESS_SIZE == 64 ? 'x64' : 'x86'
    ffi_lib "bin/win_#{arch}/raylib"
  elsif FFI::Platform.mac?
    ffi_lib 'bin/macos/libraylib'
  elsif FFI::Platform::IS_LINUX
    ffi_lib 'bin/linux_x64/libraylib'
  else
    raise 'Unknown operating system.'
  end

  # Versão do Raylib em C.
  RAYLIB_VERSION = '4.5'
end

require_relative 'raylib/helpers'
require_relative 'raylib/structs'
require_relative 'raylib/enums'
require_relative 'raylib/colors'
require_relative 'raylib/functions'

include Raylib
