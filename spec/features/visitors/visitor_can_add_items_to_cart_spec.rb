require 'rails_helper'

RSpec.feature "Visitor can add items to the cart" do
  scenario "they cane see a cart page with items and the total price" do
    item = @category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 22000000, image: "https://www.ilovenukes.com")

    visit categories_path
    expect(page).to have_button('Add to Cart')
    click_on 'Add to Cart'
    click_on 'View Cart'

    expect(page).to have_current_path(cart_path)
    expect(page).to have_content(item.title)
    expect(page).to have_css("img[src=\"#{item.image}\"]")
    expect(page).to have_content("Total: $#{item.price}")
  end
end
