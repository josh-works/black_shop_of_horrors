module ApplicationHelper

  def checkout
    "checkout"  if current_user
  end

  def login_logout_link
    if current_user
      link_to "Logout", logout_path, method: :delete
    else
      link_to "Login", login_path
    end
  end

  def dashboard_if_logged_in
    if current_user
      link_to "Dashboard", dashboard_path
    end
  end

  def cart_count
    "(#{@cart.total_count})" if @cart.total_count > 0
  end

  def checkout_cart_items
    if current_user
      link_to "Checkout", orders_path
    else
      link_to "Login or Sign up", login_path
    end
  end
end
