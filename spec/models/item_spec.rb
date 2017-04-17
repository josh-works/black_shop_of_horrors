require 'rails_helper'

RSpec.describe Item, type: :model do
  attr_reader :organs

  it "validations" do
    # it { should validate_presence_of(:title) }
    # it { should validate_uniqueness_of(:title) }
  end

  before :each do
    @organs = Category.create!(title: "Organs", image: "organs.jpg")
    @organs.items.create!(title: "Liver",
                description: "Fresh livers from the healthiest patients",
                price: 9999,
                image: "liver.jpg")
    @organs.items.create!(title: "Small Intestine",
                description: "Your intestine wearing out? Get a fresh one installed today!",
                price: 7500,
                image: "organs.jpg")
    @organs.items.create!(title: "Heart",
                description: "All of our hearts will eventually wear out. Why let yours?",
                price: 25499,
                image: "heart.jpg")
  end

  it "item can be created" do
    expect(@organs.items.count).to eq(3)
  end
end
