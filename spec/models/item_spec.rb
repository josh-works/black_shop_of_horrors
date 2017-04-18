require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should have_many(:orders) }
    it { should have_many(:invoices) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:image) }
  end

  it 'can retun its price' do
    item = Item.create(title: "power-armor", description:"become godly and take on the world", price: "2500.02", image: "power_armor.png")

    expect(item.format_price).to eq("$2,500.02")
  end

  it 'can retun its title' do
    item = Item.create(title: "power-armor", description:"become godly and take on the world", price: "2500.00", image: "power_armor.png")

    expect(item.title).to eq("power-armor")
  end

  it 'can retun its description' do
    item = Item.create(title: "power-armor", description:"become godly and take on the world", price: "2500.00", image: "power_armor.png")

    expect(item.description).to eq("become godly and take on the world")
  end

  it 'can retun its image-file name' do
    item = Item.create(title: "power-armor", description:"become godly and take on the world", price: "2500.00", image: "power_armor.png")

    expect(item.image).to eq("power_armor.png")
  end
end
