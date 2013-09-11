require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do
  
  describe '.initialize' do
    it 'records all of the toppings' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new(toppings)

      expect(pizza.toppings).to eq(toppings)
    end
    it 'defaults the toppings to cheese only, if the pizza has no toppings' do
      pizza = Pizza::Pie.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe '#vegetarian?' do
    context 'when all toppings are vegetarian' do
      let(:toppings) do
        [
          Pizza::Topping.new('mushrooms', vegetarian: true),
          Pizza::Topping.new('olives', vegetarian: true)
        ]
      end

      it 'returns true' do
        pizza = Pizza::Pie.new(toppings)
        expect(pizza.vegetarian?).to eq(true)
      end
    end
    context 'when at least one topping is not vegetarian' do
      let(:toppings) do
        [
         Pizza::Topping.new('mushrooms', vegetarian: true),
         Pizza::Topping.new('peperoni') 
        ]
      end
      it 'returns false' do
        pizza = Pizza::Pie.new(toppings)
        expect(pizza.vegetarian?).to eq(false)
      end
    end
  end

  describe '#add_topping' do
    it 'adds a topping to the @toppings array' do
      toppings = [
        Pizza::Topping.new('mushrooms', vegetarian: true),
        Pizza::Topping.new('pepperoni')
      ]
      pizza = Pizza::Pie.new(toppings)

      olives = Pizza::Topping.new('olives', vegetarian: true)

      pizza.add_topping(olives)

      expect(pizza.toppings.size).to eq(3)
      expect(pizza.toppings[2].name).to eq('olives')
    end
  end

  describe '#deliver!' do
    it 'delivers a pizza in thirty minutes' do
      pizza = Pizza::Pie.new
      pizza.deliver!(now = Time.now)
      
      expect(pizza.delivery_time).to eq(now + 30*60)
    end
  end
  
  describe '#late?' do
    it 'returns true if it is past the delivery time' do
      pizza = Pizza::Pie.new
      pizza.delivery_time = Time.now - (30)
      expect(pizza.late?).to eq(true)
    end
    it 'returns false if it is not past the deliver time' do
      pizza = Pizza::Pie.new
      pizza.delivery_time = Time.now + (30)
      expect(pizza.late?).to eq(false)
    end
  end

end 

describe Pizza::Topping do
  describe '.initialize' do
    it 'sets the name of the topping' do
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end
    it 'set whether or not the topping is vegetarian' do
      topping = Pizza::Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end
  end
end