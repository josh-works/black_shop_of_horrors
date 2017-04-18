require 'rails_helper'

RSpec.feature "Visitor can add items to the cart" do
  scenario "they cane see a cart page with items and the total price" do
    @category = Category.create!(title: "nuclear weapons", image: "nuclear_weapons.jpg")
    item = @category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 22000000, image: "nuclear_weapons.gif")

    visit category_path(@category)
    click_on 'Add Nuke to Cart'
    click_on 'View Cart'

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content(item.title)
    expect(page).to have_content("Total Cost: #{item.format_price}")
  end
end
