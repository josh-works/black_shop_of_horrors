require'rails_helper'

RSpec.feature "home page is category index", type: :feature do

  scenario "can see info on home page" do
    organs = Category.create(title: "Organs", image: "https://thumb7.shutterstock.com/display_pic_with_logo/90991/90991,1301604734,1/stock-vector-internal-organs-74337634.jpg")
    visit categories_path(organs)
    expect(page).to have_content("Welcome to the Black Market of Horrors")
    # expect(page).to have_content("Log in")
    # expect(page).to have_content("Sign up")
    expect(page).to have_content("Organs")
    expect(page).to have_link "View all Organs", categories_path(organs)
  end

end
