require 'rails_helper'

RSpec.feature "When a user visits category parent path, they see a list of
 items that belong too that category", type: :feature do
 before(:each) do
   organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
   organs.items.create!(title: "Liver", price: 350, description: "beep", image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
   organs.items.create!(title: "Small Intestines", price: 450, description: "Rick", image: "http://img.clipartall.com/illustration-of-a-small-small-intestine-clipart-1094_1300.jpg")
   organs.items.create!(title: "Heart", price: 1000, description: "Morty", image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg")
  end

  scenario "A list of items belonging to their category is displayed" do
    visit '/organs'

    expect(page).to have_content("Liver")
    expect(page).to have_content("Small Intestines")
    expect(page).to have_content("Heart")
    end
  end
