require 'rails_helper'

RSpec.describe "creating new default user" do
  context "starting from new user page" do
    it "can be created" do
      visit "/login"
      click_on 'Create Account'

      fill_in "Email", with: "seth@seth.com"
      fill_in "First name", with: "Seth"
      fill_in "Last name", with: "seth"
      fill_in "Password", with: "seth12"
      fill_in "Password confirmation", with: "seth12"

      click_on "Create Account"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Logged in as Seth")
      expect(page).to have_content("Logout")
    end
  end
end
