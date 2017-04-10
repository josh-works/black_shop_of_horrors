class PackagesController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    package = Package.new(user_name: "Seth")
    @cart.contents.each do |item_id, quantity|
      package.items.new(item_id: item_id, quantity: quantity)
    end

    if package.save
      session[:cart] = nil
      flash[:notice] = "You have #{package.items.count} illegal items to your cart."
      redirect_to root_path
    else
      #implement if you have validations
    end
  end
end
