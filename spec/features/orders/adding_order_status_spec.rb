require 'rails_helper'

RSpec.feature "can view and change order status" do
  before(:each) do
      @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
      @organs = Category.create(title: "Organs", image: "organs.jpg")
      @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "liver.jpg")
  end

  it "can update order status" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  visit category_path(@organs)

  click_on 'Add Liver to Cart'
  click_on 'View Cart (1)'

  expect(current_path).to eq(cart_path)

  click_on 'Checkout'
  expect(current_path).to eq(payments_path)

  expect(@user.orders.last.status).to eq("completed")
  @order = @user.orders.last
  click_on 'Purchase'

  expect(current_path).to eq(order_path(@order) )
  expect(@order.status).to eq("completed")
  expect(page).to have_content('Liver')
  end
end
