require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "基本功能" do
    it "可以把商品丟到到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).to be false
    end

    it "加了相同種類的商品到購物車裡，購買項目不會增加，數量會改變" do
      cart = Cart.new

      3.times { cart.add_item(1) }
      2.times { cart.add_item(2) }
      2.times { cart.add_item(1) }

      expect(cart.items.count).to be 2
    end

    it "商品可以放到購物車裡，也可以再拿出來" do
      # Arrange
      cart = Cart.new

      i1 = FactoryBot.create(:item)
      i2 = FactoryBot.create(:item)
      
      # Act
      3.times { cart.add_item(i1.id) }
      2.times { cart.add_item(i2.id) }

      # Assert
      expect(cart.items.first.item).to be_an Item
      expect(cart.items.first.item.price).to be i1.price
    end
  end

  describe "進階功能" do
  end
end