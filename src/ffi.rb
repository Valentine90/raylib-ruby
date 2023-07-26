require 'ffi'

module FFI
  class Struct
    def self.struct_attr_accessor(*args)
      struct_attr_writer(*args)
      struct_attr_reader(*args)
    end

    def self.struct_attr_writer(*args)
      args.each do |arg|
        define_method("#{arg}=") do |value|
          self[arg] = value
        end
      end
    end

    def self.struct_attr_reader(*args)
      args.each do |arg|
        define_method(arg) do
          self[arg]
        end
      end
    end
  end
end
