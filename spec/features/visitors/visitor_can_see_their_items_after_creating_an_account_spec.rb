require 'rails_helper'

RSpec.feature "Visitor can see items they added after becoming a 'user'" do
  xscenario 'they can see the items after becoming a registered user' do

    visit items_path

    click_on 'Add to Cart'

    visit cart_path

    expect(page).to have_link('Login or Create Account to Checkout')
    # I feel this is too long of a name to have for a button, I think we
    # should use a flash message to tell them they have to create an account
    # to be able to checkout.
    expect(page).not_to have_button("Checkout")
  end
end
