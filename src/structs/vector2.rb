module Raylib
  class Vector2 < FFI::Struct
    layout(
      :x, :float,
      :y, :float
    )

    def initialize(x = 0.0, y = 0.0)
      # Se Vetor2 não estiver sendo criado como tipo
      #de saída de alguma função do craylib
      if x.is_a?(Numeric)
        self.x = x
        self.y = y
      else
        pointer = x
        super(pointer)
      end
    end
    
    struct_attr_accessor :x, :y
  end
end
