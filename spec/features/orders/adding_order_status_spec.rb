require 'rails_helper'

RSpec.feature "can view and change order status" do
  before(:each) do
      @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
      @organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
      @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
  end

  it "can update order status" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

  visit category_path(@organs)

  click_on 'Add Liver to Cart'
  click_on 'View Cart (1)'

  expect(current_path).to eq(cart_path)

  click_on 'Checkout'
  expect(current_path).to eq(payments_path)

  expect(@user.orders.last.status).to eq("Completed")
  @order = @user.orders.last
  click_on 'Purchase'

  expect(current_path).to eq(order_path(@order) )
  expect(@order.status).to eq("Completed")
  expect(page).to have_content('Liver')
  end
end
