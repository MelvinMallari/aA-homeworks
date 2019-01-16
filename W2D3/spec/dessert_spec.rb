require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("Melvin Mallari") }
  subject(:boba) { Dessert.new("Boba", 50, chef ) }

  describe "#initialize" do
    it "sets a type" do
      expect(boba.type).to eq("Boba")
    end
    
    it "sets a quantity" do 
      expect(boba.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do 
      expect(boba.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("boba", "milk tea") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      boba.add_ingredient('lychee')
      expect(boba.ingredients).to include('lychee')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["milk", "tea", "boba", "sugar"]
      ingredients.each { |ingredient| boba.add_ingredient(ingredient) }
      boba.mix!
      expect(boba.ingredients).to_not eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      boba.eat(15)
      expect(boba.quantity).to eq(35)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { boba.eat(100) }.to raise_error()
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Melvin the Great Baker")
      expect(boba.serve) .to include("Chef Melvin the Great Baker")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(boba)
      boba.make_more
    end
  end
end
