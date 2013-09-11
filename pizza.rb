module Pizza
  class Pie
    attr_accessor :toppings, :delivery_time

    def initialize(toppings=[Topping.new('cheese', vegetarian: true)])
      @toppings = toppings
    end

    def vegetarian?
      !@toppings.any? { |x| !x.vegetarian }

      # !@toppings.any? { |x| !x.vegetarian }
    end

    def add_topping(topping)
      @toppings << topping
    end

    def deliver!(now = Time.now)
      @delivery_time = now + (30*60)
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



