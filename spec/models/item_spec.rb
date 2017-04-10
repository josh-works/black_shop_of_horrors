require 'rails_helper'

RSpec.describe Item, type: :model do
  it "validations" do
    # it { should validate_presence_of(:title) }
    # it { should validate_uniqueness_of(:title) }
  end

  it "item can be created" do
    Item.create(title: "Liver",
                description: "Fresh livers from the healthiest patients",
                price: 9999,
                image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
    Item.create(title: "Small Intestine",
                description: "Your intestine wearing out? Get a fresh one installed today!",
                price: 7500,
                image: "http://img.clipartall.com/illustration-of-a-small-small-intestine-clipart-1094_1300.jpg")
    Item.create(title: "Heart",
                description: "All of our hearts will eventually wear out. Why let yours?",
                price: 25499,
                image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg")
    expect(Item.count).to eq(3)
  end
end
