require'rails_helper'

RSpec.feature "home page is category index", type: :feature do

  scenario "can see info on home page" do
    Category.create!(title: "Josh's Limbs", image: "https://ca.slack-edge.com/T029P2S9M-U38EDMUCE-bf26ea5fd4a9-1024")
    visit categories_path
    expect(page).to have_content("Welcome to the Black Market of Horrors")
    expect(page).to have_content("Log in")
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Josh's Limbs")
  end

end
