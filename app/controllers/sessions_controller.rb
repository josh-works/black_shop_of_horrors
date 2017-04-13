class SessionsController < ApplicationController
  def new
  end
  def index
  end
  
  def create
  user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged In Successfully"
      redirect_to dashboard_path
    else
      flash.now[:error] = "Login unsuccessful, please check your email or password."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:loggedout] = "Logged Out"
    redirect_to login_path
  end

  def show
  end
end
