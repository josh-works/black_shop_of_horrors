require 'rails_helper'

RSpec.feature "visiting all previous orders" do
  before(:each) do
    @admin  = User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1", role: 1)
    @user   = User.create!(email: "seteth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1", role: 0)
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

  scenario "as an admin I see all orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    expect(page).to have_css(".orders", count: 1)
    expect(page).to have_link("Order ID: #{@order1.id}", href: order_path(@order1))
  end

  scenario "when clicking completed orders link I see only orders that are marked completed" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    click_on "Completed Orders"

    expect(current_path).to eq(admin_completed_path)
    expect(page).to have_css(".orders", text: "Status: Completed")
  end

  scenario "when clicking ordered orders link I see only orders that are marked ordered" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    click_on "Ordered Orders"

    expect(current_path).to eq(admin_ordered_path)
    expect(page).to have_css(".orders", text: "Status: Ordered")
  end

  scenario "when clicking paid orders link I see only orders that are marked paid" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    click_on "Paid Orders"

    expect(current_path).to eq(admin_paid_path)
    expect(page).to have_css(".orders", text: "Status: Paid")
  end

  scenario "when clicking cancelled orders link I see only orders that are marked cancelled" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    visit admin_orders_path

    click_on "Cancelled Orders"

    expect(current_path).to eq(admin_cancelled_path)
    expect(page).to have_css(".orders", text: "Status: Cancelled")
  end

  scenario "as a a normal user I see 404" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit admin_orders_path

    expect(page).to have_css(".orders", text: "The page you were looking for doesn't exist.")
    expect(page).to_not have_link("Order ID: #{@order1.id}", href: order_path(@order1))
  end
end
