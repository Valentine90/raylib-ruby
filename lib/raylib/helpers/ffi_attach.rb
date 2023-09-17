# frozen_string_literal: true

module FFI
  # Anexa função nativa C ao módulo Raylib no estilo de programação Ruby.
  module Library
    # Anexa função.
    # @param c_function [Symbol] Nome da função C.
    # @param args [Array<Symbol>] Tipos de parâmetro da função C.
    # @param returns [Symbol] Tipo de retorno da função C.
    def ray_attach_function(c_function, args, returns)
      # Substitui GetTouchX por get_touch_x, ImageRotateCW por image_rotate_cw,
      # GetFPS por get_fps, BeginMode2D por begin_mode_2d, DrawTextureNPatch por
      # draw_texture_n_patch, CodepointToUTF8 por codepoint_to_utf8 etc.
      ruby_function = c_function.to_s.split(/([A-Z]{2,}8?)$|([2-3]D)|(?=[A-Z])/).join('_').downcase
      attach_function ruby_function, c_function, args, returns
      return unless ruby_function.start_with?('is')

      # Cria métodos para o teclado e o mouse no estilo (?) Ruby, sem excluir
      # a possibilidade de utilização deles no estilo padrão do Raylib (C),
      # especialmente porque o attach_function usa internamente variável de
      # classe, que não pode ser nomeada com interrogação.
      Raylib.module_eval(
        # alias key_pressed? is_key_pressed
        "alias #{ruby_function.delete_prefix('is_')}? #{ruby_function}", __FILE__, __LINE__
      )
    end
  end
end
