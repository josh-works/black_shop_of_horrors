require 'rails_helper'

RSpec.describe User do
  before(:each) do
    User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
  end

  it "can log in and out with right credentials" do
    visit '/login'

    expect(page).to have_content("Create Account")
    fill_in "Email", with: "seth@seth"
    fill_in "Password", with: "banana1"

    click_on "Sign In"

    expect(current_path).to eq(dashboard_path)

    click_on "Logout"

    expect(current_path).to eq(login_path)

  end

  it "cannot login without correct password" do
    visit '/login'

    fill_in "Email", with: "seth@seth"
    fill_in "Password", with: "banadsfsa1"
    click_on "Login"

    expect(current_path).to eq(login_path)
    # expect(page).to have_content("Login unsuccessful, please check your email or password.")
  end

  it "cannot login without correct email" do
    visit '/login'

    fill_in "Email", with: "set@eth"
    fill_in "Password", with: "banana1"
    click_on "Login"

    expect(current_path).to eq(login_path)
    # expect(page).to have_content("Login unsuccessful, please check your email or password.")
  end
end
