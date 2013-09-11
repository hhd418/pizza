require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do

end 

describe Pizza::Topping do
  describe '.initialze' do
    it 'sets the name of the topping' do
      topping = Pizza::Topping.new('olives')

      expect(topping.name).to eq('olives')
    end
    it 'set whether or not the topping is vegetarion' do
      topping = Pizza::Topping.new('bell peppers', vegetarian: true)

      expect(topping.vegetarian).to eq(true)
    end
  end
end