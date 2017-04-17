require 'rails_helper'

RSpec.feature "Viewing order history of illegal items" do
  before(:each) do
    @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
    @organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
    @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
    @item2 = @organs.items.create!(title: "Small Intestines", price: 450, description: "Rick", image: "http://img.clipartall.com/illustration-of-a-small-small-intestine-clipart-1094_1300.jpg")
    @item3 = @organs.items.create!(title: "Heart", price: 1000, description: "Morty", image: "http://www.sciencemadesimple.co.uk/files/2016/10/sn-pigheart.jpg")
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

    click_on "Purchase"
    
    click_on "Back to all orders"

    # expect(current_path).to eq(order_path(@user.orders.last))
    expect(page).to have_content("View Cart")
    expect(page).to_not have_content("View Cart (4)")


    expect(page).to have_content(@item1.title)
    expect(page).to have_content(@item2.title)
    expect(page).to have_content(@item3.title)
  end
end
