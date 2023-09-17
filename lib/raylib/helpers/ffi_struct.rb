# frozen_string_literal: true

module FFI
  # Cria atalho para leitura e/ou gravação de dados das estruturas.
  class Struct
    # Cria métodos de leitura e de gravação.
    # @param args [Symbol] Nome do(s) método(s).
    def self.ray_attr_accessor(*args)
      ray_attr_writer(*args)
      ray_attr_reader(*args)
    end

    # Cria método(s) de gravação.
    # @param args [Symbol] Nome do(s) método(s).
    def self.ray_attr_writer(*args)
      args.each do |arg|
        define_method("#{arg}=") do |value|
          self[arg] = value
        end
      end
    end

    # Cria método(s) de leitura.
    # @param args [Symbol] Nome do(s) método(s).
    def self.ray_attr_reader(*args)
      args.each do |arg|
        define_method(arg) do
          self[arg]
        end
      end
    end
  end
end
