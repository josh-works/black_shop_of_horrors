require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should have_many(:orders) }
    it { should have_many(:invoices) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:title) }
    # it { should validate_numericality_of(:price) }
    it { should validate_uniqueness_of(:image) }
    # it { should validate_presence_of(:categories) }s
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
  # attr_reader :organs
  #
  # it "validations" do
  #   # it { should validate_presence_of(:title) }
  #   # it { should validate_uniqueness_of(:title) }
  # end
  #
  # before :each do
  #   @organs = Category.create!(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
  #   @organs.items.create!(title: "Liver",
  #               description: "Fresh livers from the healthiest patients",
  #               price: 9999,
  #               image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
  #   @organs.items.create!(title: "Small Intestine",
  #               description: "Your intestine wearing out? Get a fresh one installed today!",
  #               price: 7500,
  #               image: "http://img.clipartall.com/illustration-of-a-small-small-intestine-clipart-1094_1300.jpg")
  #   @organs.items.create!(title: "Heart",
  #               description: "All of our hearts will eventually wear out. Why let yours?",
  #               price: 25499,
  #               image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg")
  # end
  #
  # it "item can be created" do
  #   expect(@Items.count).to eq(3)
  # end
