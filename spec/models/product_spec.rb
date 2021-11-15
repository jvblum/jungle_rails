require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validation" do
    it  "is valid with valid attributes" do
      @test = Product.new({name: "A Magic Chair", price: 300, quantity: 2, category: Category.new})
      expect(@test).to be_valid
      pp expect(@test.errors.full_messages)
    end
    it "is not valid without a name" do
      @test = Product.new({name: nil, price: 300, quantity: 2, category: Category.new})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Name can't be blank")
    end
    it "is not valid without a price" do
      # price => price_cents
      @test = Product.new({name: "A Magic Chair", price_cents: nil, quantity: 2, category: Category.new})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Price can't be blank")
    end
    it "is not valid without a quantity" do
      @test = Product.new({name: "A Magic Chair", price: 300, quantity: nil, category: Category.new})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Quantity can't be blank")
    end
    it "is not valid without a category" do
      @test = Product.new({name: "A Magic Chair", price: 300, quantity: 2, category: nil})
      expect(@test).to_not be_valid
      expect(@test.errors.full_messages).to include("Category can't be blank")
    end
  end
end
