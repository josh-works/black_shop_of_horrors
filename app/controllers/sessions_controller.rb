class SessionsController < ApplicationController
  def new
  end

  def index
  end

  def create
  user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged In Successfully"
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Login unsuccessful, please check your email or password."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to login_path
  end

  def show
  end
end
