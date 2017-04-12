class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:loggedin] = "Logged In Successfully"
      redirect_to root_path
    else
      flash.now[:notice] = "Sorry buddy, but no."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to login_path
  end

  def index
  end
end
