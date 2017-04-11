require 'rails_helper'

RSpec.describe Cart, type: :model do
  before :each do
    weapons = Category.create(title: "Weapons", image: "www.nuke.com")
    weapons.items.create(title: "Nuke", image: "www.nuke.com", id: 1)
  end

  it "can calculate the total number of items it holds" do
    cart = Cart.new({"1" => 2, "2" => 3})

    expect(cart.total_count).to eq(5)
  end

  it "can add an item to its contents" do
    cart = Cart.new({"1" => 1})

    cart.add_item(1)
    cart.add_item(2)

    expect(cart.contents).to eq({"1" => 2, "2" => 1})
  end

  it "can report on how many of a particular item it has" do
    cart = Cart.new({"1" => 3, "2" => 1})

    expect(cart.count_of(1)).to eq(3)
  end

  it "knows its item ids" do
    cart = Cart.new({"1" => 3, "2" => 1})
    expect(cart.contents.keys.first).to eq("1")
    expect(Item.find(cart.contents.keys.first).title).to eq("Nuke")
  end

  context "can remove single item from cart" do
    it "deletes one item" do
      cart = Cart.new({"1" => 3, "2" => 1})
      cart.delete("1")
      cart.delete("2")
      expect(cart.total_count).to eq(2)
    end
  end
end
