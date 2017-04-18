require 'rails_helper'


RSpec.feature "categories show page" do
  scenario "should show all items associated" do
    category = Category.create(title: "Organs", image: "organs.jpg")
    category.items.create(title: "item1", image: "Hey", description: "asfojg", price: 5500)
    category.items.create(title: "item2", image: "How", description: "healkfhealf", price: 3500)

    visit "/organs"
    expect(page).to have_content("item1")
    expect(page).to have_content("item2")
  end
end
# As a visitor
#  When I visit "/:CATEGORY_NAME"
#  I see all items assigned to that category
