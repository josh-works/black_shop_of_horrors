require "rails_helper"

RSpec.describe "Admin viewing Orders" do
  before(:each) do
    @admin = User.create!(email: "admin@admin", first_name: "admin", last_name: "admin", password: "admin1", password_confirmation: "admin1", role: 1)
    @user = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
    @organs = Category.create(title: "Organs", image: "https://www.google.com/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=0ahUKEwivofOz-prTAhVLw2MKHaUHA_AQjRwIBw&url=http%3A%2F%2Fwww.shutterstock.com%2Fth%2Fpic-74337634%2Fstock-vector-internal-organs.html&psig=AFQjCNEyPRiWory-xw7aICgmJXUQg_zDkw&ust=1491950374950491")
    @item1 = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "https://ichef-1.bbci.co.uk/news/1024/media/images/73793000/jpg/_73793871_liver.jpg")
    @user.orders.create
    @user.orders.create
    @user.orders.first.invoices.create(item_id: 1, quantity: 2)
    @user.orders.last.invoices.create(item_id: 1, quantity: 3)
  end

  context "when visiting /admin/orders" do
    it "shows all orders" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
      visit admin_orders_path

      expect(page).to have_content("All Orders History")
      expect(page).to have_content("Order ID: 1")
      expect(page).to have_content("Order ID: 2")
    end
  end
end
