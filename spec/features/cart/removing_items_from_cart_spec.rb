require 'rails_helper'

RSpec.describe "When removing items from cart" do
  before(:each) do
    @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
    @organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
    @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
  end
  it "Show flash with link to item that takes you to show page" do
    visit "/organs"
    click_on "Add Liver to Cart"

    visit cart_path

    click_on "Remove Item"

    expect(page).to have_content("Liver removed from Cart")
    save_and_open_page

    click_on "Liver"

    expect(current_path).to eq(item_path(@item1))
  end
end
