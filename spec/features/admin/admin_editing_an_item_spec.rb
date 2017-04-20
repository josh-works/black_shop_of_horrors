require 'rails_helper'

RSpec.feature "an admin visits /admin/items" do
  scenario "it has an edit button" do
    @admin = User.create(first_name: "asdf", last_name: "asdlfkas", email: "djasfalksd", password: 'asdf', password_confirmation: 'asdf', role: 1)
    @category = Category.create(title: "Boring Item", image: "image.jpg")
    @item = @category.items.create(title: "item1", description: "boring item, josh", image: "image.jpg", price: "500")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_items_path
    click_on "Edit"

    expect(current_path).to eq(edit_admin_item_path(@item))

    fill_in "Title", with: "Joshs boring item"
    fill_in "Description", with: "blah"
    fill_in "Price", with: "500"
    fill_in "Image", with: "image.jpg"
    click_on "Update"

    expect(current_path).to eq(item_path(@item))
    expect(page).to have_content("Joshs boring item")
    expect(page).to_not have_content("item1")

    click_on "Edit"

    expect(current_path).to eq(edit_admin_item_path(@item))
  end
end
