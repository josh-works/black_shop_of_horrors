require 'rails_helper'

RSpec.feature "admin can change their own info" do
  before(:each) do
    @admin = User.create!(email: "seth@seth", first_name: "seth", last_name:
     "seth", password: "banana1", password_confirmation: "banana1", role: 1)
  end
  scenario "admin changes info" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  visit dashboard_path
  click_on 'Edit Account'
  expect(current_path).to eq(edit_admin_user_path(@admin) )
  fill_in 'First name', with: 'Chris'
  click_on 'Edit Account'

  expect(current_path).to eq(dashboard_path)
  expect(page).to have_content("Chris")
  end
end
