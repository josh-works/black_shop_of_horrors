require 'rails_helper'

RSpec.feature "Can add item to a cart", type: :feature do
  attr_reader :category
  before :each do
    Package.create!(username: "Charlie")
    @category = Category.create!(title: "Nuclear Weapons", image: "https://www.google.com")
    @category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 22000000, image: "https://www.ilovenukes.com")
    @category.items.create!(title: "Radioactive Terrorists", description: "Destroy everything", price: 5, image: "https://www.yikes.com")
  end

  scenario "adding items to cart" do
    visit root_path

    click_on "View all Nuclear Weapons"

    expect(current_path).to eq(category_path(category))

    expect(page).to have_content("Nuke")
    expect(page).to have_content("Blow thine enemies to smitherines")
    expect(page).to have_content("22000000")

    expect(page).to have_content("Radioactive Terrorists")
    expect(page).to have_content("Destroy everything")
    expect(page).to have_content("5")

    expect(page).to have_content("Items in Cart: 0")

    click_on "Add Nuke to Cart!"

    expect(page).to have_content("Items in Cart: 1")

    click_on "Add Radioactive Terrorists to Cart!"

    expect(page).to have_content("Items in Cart: 2")
  end



  scenario "removing items from cart" do
    # As a visitor
    # When I visit "/cart"
    visit root_path

    click_on "View all Nuclear Weapons"

    expect(current_path).to eq(category_path(category))

    expect(page).to have_content("Nuke")
    expect(page).to have_content("Blow thine enemies to smitherines")
    expect(page).to have_content("22000000")
    expect(page).to have_content("Radioactive Terrorists")
    expect(page).to have_content("Destroy everything")
    expect(page).to have_content("5")
    expect(page).to have_content("Items in Cart: 0")
    click_on "Add Nuke to Cart!"
    expect(page).to have_content("Items in Cart: 1")
    click_on "Add Radioactive Terrorists to Cart!"

    visit cart_path

    binding.pry








    # --------------
    # @cart = Cart.new({@category.items.first.id.to_s => 1,
    #                 @category.items.last.id.to_s => 1})
    # binding.pry
    # visit cart_path
    #
    # expect(page).to have_content("Radioactive Terrorists")
    # expect(page).to have_content("Nuke")
    # expect(page).to have_content("Your shopping cart")
    #
    # # And I click link "Remove"
    #
    # # parent child relationship :last???
    # click_on "Remove"
    # # Then my current page should be "/cart"
    # expect current_path.to eq(cart_path)
    # # And the message should say "Successfully removed SOME_ITEM from your cart."
    # expect(page).to have_content "Successfully removed SOME_ITME from your cart."
    # # And I should see a message styled in green
    # # within Flash, have_content "re-add SOMEITEM"
    # # within Flash, have_link "re-add SOMEITEM", href: "add item link"
    #
    # expect(page).to have_content("Re-add SOME_ITEM")
    # # And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    # expect(page).to have_content("Nuke")
    # # And I should not see the item listed in cart
  end
end
