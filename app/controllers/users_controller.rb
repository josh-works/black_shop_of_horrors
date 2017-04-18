class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Logged in as #{@user.first_name}"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to dashboard_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
