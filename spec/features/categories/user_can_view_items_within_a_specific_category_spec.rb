require 'rails_helper'

RSpec.feature "When a user visits category parent path, they see a list of
 items that belong too that category", type: :feature do
 before(:each) do
   organs = Category.create(title: "Organs", image: "organs.jpg")
   organs.items.create!(title: "Liver", price: 350, description: "beep", image: "liver.jpg")
   organs.items.create!(title: "Small Intestines", price: 450, description: "Rick", image: "organs.jpg")
   organs.items.create!(title: "Heart", price: 1000, description: "Morty", image: "heart.jpg")
  end

  scenario "A list of items belonging to their category is displayed" do
    visit '/organs'

    expect(page).to have_content("Liver")
    expect(page).to have_content("Small Intestines")
    expect(page).to have_content("Heart")
    end
  end
