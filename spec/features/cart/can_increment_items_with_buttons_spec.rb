require 'rails_helper'

RSpec.feature "Can increment items in a cart", type: :feature do
  attr_reader :category
  before :each do
    @category = Category.create!(title: "Nuclear Weapons", image: "https://www.google.com")
    @item1 = @category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 22000000, image: "https://www.ilovenukes.com")
  end

  it "increments by one when you click '+'" do
    visit category_path(@category)

    click_on "Add Nuke to Cart!"

    visit cart_path

    expect(page).to have_content("Quantity 1")

    click_on "+"

    expect(page).to have_content("Quantity 2")

    click_on "-"
    expect(page).to have_content("Quantity 1")

  end

end
