require 'rails_helper'

RSpec.feature "admin can change order status" do
  before(:each) do
    @admin  = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1", role: 1)
    @user  = User.create!(email: "setth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1", role: 1)
    @organs = Category.create(title: "Organs", image: "organs.jpg")
    @item1  = @organs.items.create!(title: "Liver", price: 350, description: "beep", image: "liver.jpg")
    @order1 = @user.orders.create
    @order2 = @user.orders.create(status: "paid")
    @order3 = @user.orders.create(status: "ordered")
    @order4 = @user.orders.create(status: "cancelled")
    @order1.invoices.create(item_id: @item1.id, quantity: 3)
    @order2.invoices.create(item_id: @item1.id, quantity: 2)
    @order3.invoices.create(item_id: @item1.id, quantity: 1)
    @order4.invoices.create(item_id: @item1.id, quantity: 4)
  end

  scenario "can change ordered to paid" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    within("#order_#{@order3.id}") do
      expect(page).to have_button("Paid")
      click_on "Paid"
    end

    within("#order_#{@order3.id}") do
      expect(page).to have_content("Status: Paid")
    end

    expect(page).to have_css(".admin_status_links", text: "Paid Orders: 2")
  end

  scenario "can change paid to completed" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    within("#order_#{@order2.id}") do
      expect(page).to have_content("Status: Paid")
      click_on "Completed"
    end

    within("#order_#{@order2.id}") do
      expect(page).to have_content("Status: Completed")
    end
  end

  scenario "can change paid to cancelled" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    within("#order_#{@order2.id}") do
      expect(page).to have_content("Status: Paid")
      click_on "Cancel"
    end

    within("#order_#{@order2.id}") do
      expect(page).to have_content("Status: Cancelled")
    end
  end

  scenario "can change ordered to cancelled" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    within("#order_#{@order3.id}") do
      expect(page).to have_content("Ordered")
      click_on "Cancel"
    end

    within("#order_#{@order3.id}") do
      expect(page).to have_content("Status: Cancelled")
    end
  end
end
