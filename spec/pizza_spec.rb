require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../pizza'

describe Pizza::Pie do

end 

describe Pizza::Topping do
  describe '.initialze' do
    it 'sets the name of the topping' do
      topping = Pizza::Topping.new('olvies')

      expect(topping.name).to eq('olives')
    end
  end
end