require 'rails_helper'

RSpec.feature "Category can be created", type: :feature do
  scenario "can create a new category" do
    visit new_category_path
    fill_in "Title", with: "Biological Weapons"
    fill_in "Image", with: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/WMD-biological.svg/200px-WMD-biological.svg.png"

    click_on "Create Category"

    expect(current_path).to eq('/biological-weapons')
    expect(page).to have_content("Biological Weapons")
    expect(page).to have_css("img[src*='https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/WMD-biological.svg/200px-WMD-biological.svg.png']")
  end
end
