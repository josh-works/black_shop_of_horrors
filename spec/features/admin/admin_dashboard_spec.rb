require 'rails_helper'

RSpec.describe "Visiting admin/dashboard" do
  before(:each) do
    @admin = User.create(first_name: "Admin",
                last_name: "Admin",
                email: "Admin@admin",
                password: "pass",
                password_confirmation: "pass",
                role: 1)
    @user = User.create(first_name: "user",
                last_name: "user",
                email: "user@user.com",
                password: "pass",
                password_confirmation: "pass",
                role: 0)
  end
  it "shows admin dashboard as an admin" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_dashboard_path

    expect(page).to_not have_content("404")
  end

  it "shows 404 if normal user" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end
end
