module Pizza
  class Pie

  end

  class Topping
    attr_accessor :name
    
    # Instantiate a new topping.
    #
    # name - The String name of the topping.
    #
    # Returns a new Topping object.
    def initialize(name)
      @name = name
    end
  end
end