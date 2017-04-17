require 'rails_helper'

RSpec.describe Cart, type: :model do
  before :each do
    weapons = Category.create(title: "Weapons", image: "www.nuke.com")
    @i1 = weapons.items.create(title: "Nuke", image: "www.nuke.com", price: 22, description: "hello world!")
    @i2 = weapons.items.create(title: "Banana", image: "www.banana.com", price: 23, description: "hi josh, chris, and banana")
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
    cart = Cart.new({@i1.id.to_s => 3, @i2.id.to_s => 1})
    expect(cart.items.first).to be_an_instance_of(Item)
    expect(Item.find(cart.contents.keys.first).title).to eq("Nuke")
  end

  context "can remove single item from cart" do
    it "deletes item" do
      cart = Cart.new({"1" => 3, "2" => 1})
      cart.delete("1")
      cart.delete("2")
      expect(cart.total_count).to eq(0)
    end
  end

  it "calculates total cost of items" do
    cart = Cart.new({@i1.id.to_s => 3, @i2.id.to_s => 1})
    expect(cart.total_cost).to eq("$89.00")
  end
end
