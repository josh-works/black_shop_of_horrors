module ApplicationHelper

  def checkout
    "checkout"  if current_user
  end
end
