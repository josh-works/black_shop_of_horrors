require 'rails_helper'

RSpec.feature "When a user visits category parent path, they see a list of
 items that belong too that category", type: :feature do
 before(:each) do
   Item.create(name: "Liver",
                price: 350,
                category_id: 3)
   Item.create(name: "Small Intestines",
                price: 450,
                category_id: 2)
   Item.create(name: "Heart",
                price: 1000,
                category_id: 1)
  end

  scenario "A list of items belonging to their category is displayed" do
    visit category_path
    expect(page).to have_content("Liver")
    expect(page).to have_content("Small Intestines")
    expect(page).to have_content("Heart")
    end
  end
