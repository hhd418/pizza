module Pizza
  class Pie
    attr_accessor :toppings

    def initialize(toppings=[Topping.new('cheese', vegetarian: true)])
      @toppings = toppings
    end

    def vegetarian?
      if @toppings.any? { |x| x.vegetarian == false }
        return false
      else
        return true
      end
      # !@toppings.any? { |x| !x.vegetarian }
    end
  end

  class Topping
    attr_accessor :name, :vegetarian

    # Instantiate a new topping.
    #
    # name       - The String name of the topping.
    # vegetarian - The Boolean indicating whether or not the topping is
    #              vegetarian.
    #
    # Returns the new Topping.
    def initialize(name, vegetarian: false)
      @name = name
      @vegetarian = vegetarian
    end
  end
end



