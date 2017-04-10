require 'rails_helper'

RSpec.feature "Can add item to a cart", type: :feature do
  scenario "empty card adding one item" do
    Package.create!(username: "Charlie", id: 1)

    category = Category.create!(title: "Nuclear Weapons", image: "https://www.google.com")
    category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 22000000, image: "https://www.ilovenukes.com", package_id: 1)
    category.items.create!(title: "Radioactive terrorists", description: "Destroy everything", price: 5, image: "https://www.yikes.com", package_id: 1)
    visit root_path

    click_on "View all Nuclear Weapons"

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Nuke")
    expect(page).to have_content("Blow thine enemies to smitherines")
    expect(page).to have_content("22000000")

    expect(page).to have_content("Radioactive terrorists")
    expect(page).to have_content("Destroy everything")
    expect(page).to have_content("5")

    click_on "Add Nuke to Cart!"
    click_on "Add Radioactive terrorists to Cart!"

    expect(cart).to eq(2)
  end
end
