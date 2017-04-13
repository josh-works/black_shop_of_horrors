require 'rails_helper'

RSpec.feature "Visitor can get to the new accounts page from the login button" do
  xscenario "they can get to new account page and make an account" do
    visit '/'
    expect(page).to have_content('Login')

    click_link 'Login'
    expect(current_path).to eq(login_path)

    find("input[placeholder='Username']")
    find("input[placeholder='Password']")

    expect(page).to have_content('Create Account')
end

xscenario "Visitor can create a new account" do
  visit '/login'
  click_link 'Create Account'

  fill_in('Username', with: "Seth")
  fill_in('Password', with: "Space")
  fill_in('Password Confirm', with: "Space")

  click_button 'Create Account'

  expect(current_path).to eq(dashboard_path)
  # I'm not sure if we want to make a dashboard for this or just have an actual page
  expect(page).to have_content('Logged in as Seth')
  expect(page).to have_content('Hello, Seth')
  expect(page).to_not have_content('Login')
  expect(page).to_not have_content('Logout')
end

xscenario 'Visitor can not create a new account without username' do
    visit '/login'
    click_link 'Create Account'

    fill_in('Username', with: "Seth")
    fill_in('Password', with: "Space")
    fill_in('Password Confirm', with: "Space")

    click_button 'Create Account'

    expect(page).to have_content('Create your own BSH account!')
  end
end
