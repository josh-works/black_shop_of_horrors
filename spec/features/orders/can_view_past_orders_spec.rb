require 'rails_helper'

RSpec.feature "Viewing order history of illegal items" do
  before(:each) do
    @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
    @organs = Category.create(title: "Organs", image: "organs.jpg")
    @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "liver.jpg")
    @item2 = @organs.items.create!(title: "Small Intestines", price: 450, description: "Rick", image: "organs.jpg")
    @item3 = @organs.items.create!(title: "Heart", price: 1000, description: "Morty", image: "heart.jpg")
  end
  it "can view history" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit category_path(@organs)
    click_on "Add Liver to Cart"
    click_on "Add Small Intestines to Cart"
    click_on "Add Heart to Cart"
    expect(page).to have_content("View Cart (3)")

    click_on "View Cart"

    click_on "Checkout"
    expect(current_path).to eq(order_path(@user.orders.last))

    expect(page).to have_content("View Cart")
    expect(page).to_not have_content("View Cart (4)")


    expect(page).to have_content(@item1.title)
    expect(page).to have_content(@item2.title)
    expect(page).to have_content(@item3.title)
  end
end
