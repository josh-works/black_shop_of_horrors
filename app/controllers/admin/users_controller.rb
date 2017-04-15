class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def edit
    @admin = current_user
  end
end
