# require 'rails_helper'
#
# RSpec.feature "Checking out items" do
#   before(:each) do
#     User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
#     @category = Category.create!(title: "Nuclear Weapons", image: "https://www.google.com")
#     @item = @category.items.create!(title: "Nuke", description: "Blow thine enemies to smitherines", price: 34, image: "https://www.ilovenukes.com")
#   end
#   it "redirects to dashboard after completion" do
#     visit '/nuclear-weapons'
#
#     click_on "Add Nuke to Cart!"
#     expect(page).to have_content("Items in Cart: 1")
#
#     visit '/cart'
#     click_on "Checkout"
#
#     expect(current_path).to eq(orders_path)
#     expect(page).to have_content("Purchase successful")
#
#     click_on("Orders")
#
#     expect(current_path).to eq(orders_path)
#     expect(page).to have_content("Total cost: $34")
#     expect(page).to have_content("Total Items Bought: 1")
#     expect(page).to have_content("Nukes: 1")
#     expect(page).to have_content("description: Blow thine enemies to smitherines")
#   end
# end


# Background: An existing user that has multiple orders
#
#      As an Authenticated User
#      When I visit “/orders”
#      Then I should see all orders belonging to me and no other orders
