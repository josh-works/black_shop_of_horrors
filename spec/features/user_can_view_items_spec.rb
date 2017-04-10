require 'rails_helper'

RSpec.describe "as a visitor" do

  # Background: I have several items and each of them has a title, description, price, and image
  before :each do
    Item.create()
    Item.create()
    Item.create()
  end

  # title: Visitor can view items
  context "can view all items" do
    it "when on home page" do
      # As a visitor

      # When I visit "/items"
      visit items_path

      # I can see all existing items
      expect(page).to have_content()
      expect(page).to have_content()
      expect(page).to have_content()
    end
  end
end
