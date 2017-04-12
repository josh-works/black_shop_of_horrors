require 'rails_helper'

RSpec.describe "creating new default user" do
  context "starting from new user page" do
    it "can be created" do
      visit "/signup"
      fill_in "Email", with: "seth@seth.com"
      fill_in "First name", with: "Seth"
      fill_in "Last name", with: "seth"
      fill_in "Password", with: "seth12"
      fill_in "Password confirmation", with: "seth12"

      click_on "Create User"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Account Created!")
      expect(page).to have_content("logout")
    end
  end
end
