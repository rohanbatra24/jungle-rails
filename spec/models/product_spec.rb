require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
    
    
    it "is valid with valid attributes" do
      @footwear = Category.new(name: "Footwear")
      @product = Product.new(name: "Shoe",
      description: "Lorem ipsum",
      price: 5,
      quantity: 6,
      category: @footwear)
    
    expect(@product).to be_valid
    end
    it "is not valid without a name" do
      @footwear = Category.new(name: "Footwear")
      @product = Product.new(name: "Shoe",
      description: "Lorem ipsum",
      price: 5,
      quantity: nil,
      category: @footwear)
      @product.name= nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @footwear = Category.new(name: "Footwear")
      @product = Product.new(name: "Shoe",
      description: "Lorem ipsum",
      quantity: 6,
      category: @footwear)
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @footwear = Category.new(name: "Footwear")
      @product = Product.new(name: "Shoe",
      description: "Lorem ipsum",
      price: 5,
      quantity: nil,
      category: @footwear)
      @product.quantity= nil
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @footwear = Category.new(name: "Footwear")
      @product = Product.new(name: "Shoe",
      description: "Lorem ipsum",
      price: 5,
      quantity: nil,
      category: @footwear)
      @product.category= nil
      expect(@product).to_not be_valid
  end
end
end

