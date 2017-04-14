require 'rails_helper'

RSpec.describe "as a visitor" do

  before :each do
    organs = Category.create(title: "Organs", image: "https://www.google.com/image.png")
    organs.items.create(title: "Liver",
                description: "Fresh livers from the healthiest patients",
                price: 9999,
                image: "https://ichef-1.bbci.co.uk/liver.jpg")
    organs.items.create(title: "Small Intestine",
                description: "Your intestine wearing out? Get a fresh one installed today!",
                price: 7500,
                image: "http://img.clipartall.com/i.jpg")
    organs.items.create(title: "Heart",
                description: "All of our hearts will eventually wear out. Why let yours?",
                price: 25499,
                image: "http://www.sciencemadesimple.co.ut.jpg")
  end

  context "can view all items" do
    it "when on home page" do

      visit items_path
      expect(page).to have_css('.items')
      expect(page).to have_selector('.item_title', text: "Small Intestine")
      expect(page).to have_selector('.item_title', count: 3)
      expect(page).to have_selector('.price', text: /\$[,\d]+\.\d\d/)
      expect(page).to have_css("img[src='https://ichef-1.bbci.co.uk/liver.jpg']")
    end
  end
end
