require 'rails_helper'

RSpec.describe "as a visitor" do

  before :each do
    @organs = Category.create(title: "Organs", image: "https://www.google.com/image.png")
    @organs.items.create(title: "Liver",
                description: "Fresh livers from the healthiest patients",
                price: 9999,
                image: "https://ichef-1.bbci.co.uk/liver.jpg")
    @organs.items.create(title: "Small Intestine",
                description: "Your intestine wearing out? Get a fresh one installed today!",
                price: 7500,
                image: "http://img.clipartall.com/i.jpg")
    @organs.items.create(title: "Heart",
                description: "All of our hearts will eventually wear out. Why let yours?",
                price: 25499,
                image: "http://www.sciencemadesimple.co.ut.jpg",
                status: 1)
  end

  context "on a category show page" do
    it "doesn't show retired items" do
      visit category_path(@organs)

      expect(page).to have_css(".category_description", count: 2)
      expect(page).to_not have_content(@organs.items.last.title)

    end
  end


end
