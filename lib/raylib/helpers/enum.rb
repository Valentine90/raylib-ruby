# frozen_string_literal: true

# Cria tipo de enumeração.
#
# Esse enum não faz parte e não depende da biblioteca FFI. Ele permite,
# inclusive, a introdução, no seu jogo, de novos tipos sem a importação
# da lib FFI.
# Sua definição e utilização é semelhante ao enum da linguagem Crystal,
# sem símbolos.
#
# Visite o site https://github.com/Valentine90/enum-ruby/tree/main
# para mais informações.
module Raylib
  # Cria tipo de enumeração.
  # @param constant_names [String] Nome das constantes.
  def self.ray_enum(constant_names)
    Module.new do |mod|
      n = 0
      constant_names.each_with_index do |const, i|
        if constant_names[i + 1].to_i.positive?
          n = constant_names[i + 1].to_i

          constant_names.delete_at(i + 1)
        end

        mod.const_set(const.to_s, n)

        n += 1
      end
    end
  end
end
