require 'rails_helper'

RSpec.feature "Visitor can get to the new accounts page from the login button" do
  scenario "they can get to new account page and make an account" do
    visit '/'
    expect(page).to have_content('Login')

    click_link 'Login'
    expect(current_path).to eq(login_path)

    expect(page).to have_content('Create Account')
end

scenario "Visitor can create a new account" do
  visit '/login'
  click_link 'Create Account'

  fill_in('Email', with: "Seth")
  fill_in('Last name', with: "Seth")
  fill_in('First name', with: "Seth")
  fill_in('Password', with: "Space")
  fill_in('Password confirmation', with: "Space")

  click_button 'Create Account'

  expect(current_path).to eq(dashboard_path)
  # I'm not sure if we want to make a dashboard for this or just have an actual page
  expect(page).to have_content('Logged in as Seth')
  expect(page).to_not have_content('Login')
  expect(page).to have_content('Logout')
  end
end
