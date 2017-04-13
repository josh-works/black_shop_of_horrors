require 'rails_helper'

RSpec.describe User do
  it "logs in with right credentials" do
    User.create!(email: "seth@seth", first_name: "seth", last_name: "seth", password: "banana1", password_confirmation: "banana1")
    visit '/login'

    fill_in "Email", with: "seth@seth"
    fill_in "Password", with: "banana1"

    click_on "Login"

    expect(current_path).to eq(root_path)
  end
end
