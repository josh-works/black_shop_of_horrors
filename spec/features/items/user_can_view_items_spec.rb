require 'rails_helper'

RSpec.describe "as a visitor" do

  # Background: I have several items and each of them has a title, description, price, and image
  before :each do
    organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
    organs.items.create(title: "Liver",
                description: "Fresh livers from the healthiest patients",
                price: 9999,
                image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
    organs.items.create(title: "Small Intestine",
                description: "Your intestine wearing out? Get a fresh one installed today!",
                price: 7500,
                image: "http://img.clipartall.com/illustration-of-a-small-small-intestine-clipart-1094_1300.jpg")
    organs.items.create(title: "Heart",
                description: "All of our hearts will eventually wear out. Why let yours?",
                price: 25499,
                image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg")
  end
  # title: Visitor can view items
  context "can view all items" do
    it "when on items index page" do
      # As a visitor

      # When I visit "/items"
      visit items_path

      # I can see all existing items
      expect(page).to have_content("Fresh livers from the healthiest patients")
      expect(page).to have_content(9999)
      expect(page).to have_css("img[src='https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg']")
    end
  end
end
