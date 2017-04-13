require'rails_helper'

RSpec.feature "home page is category index", type: :feature do

  xscenario "can see info on home page" do
    organs = Category.create(title: "Organs", image: "https://thumb7.shutterstock.com/display_pic_with_logo/90991/90991,1301604734,1/stock-vector-internal-organs-74337634.jpg")
    visit categories_path
    expect(page).to have_content("Welcome to the Black Market of Horrors")
    expect(page).to have_content("Organs")
    expect(page).to have_link "View all Organs", category_path(organs)
  end

end
