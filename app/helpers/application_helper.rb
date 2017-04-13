module ApplicationHelper

  def checkout
    "checkout"  if current_user
  end

  def log_title
    if current_user
      "Logout"
    else
      "Login"
    end
  end

  def log_route
    if current_user
      logout_path
    else
      login_path
    end
  end

  def log_method
    if current_user
      "delete"
    else
      "get"
    end
  end
end
