require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.create(name: "Example category")
      @product = Product.create(
        name: "Example product",
        price_cents: 20.99,
        quantity: 5,
        category: @category
        )
    end

    it 'ensures that product with all required fields successfully saved' do
    expect(@product.save). to be true
    end

    it 'throws an error if name is not filled' do
      @product.name = nil
      expect(@product.save). to be false
      expect(@product.errors.full_messages). to include("Name can't be blank")
      end


    it 'is not valid without a price' do
      @product.price_cents = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'throws an error if quantity is not filled' do
      @product.quantity = nil
      expect(@product.save). to be false
      expect(@product.errors.full_messages). to include("Quantity can't be blank")
    end

    it 'throws an error if category is empty' do
      @product.category = nil
      expect(@product.save). to be false
      expect(@product.errors.full_messages). to include("Category can't be blank")
      end

  end
end
