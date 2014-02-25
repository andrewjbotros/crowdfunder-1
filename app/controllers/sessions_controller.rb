class SessionsController < ApplicationController

  def new
  end

  def create
    user =  User.find_by(username: params[:session][:signin_id]) ||
            User.find_by(email: params[:session][:signin_id])

    if user && user.authenticate(params[:session][:password])
      signin user
      flash[:info] = "You are now signed in"
      redirect_to current_user
    else
      flash.now[:warning] = "Invalid username/email and password combination"
      render :new
    end
  end

  def destroy
    signout
    flash[:info] = "You are now signed out"
    redirect_to root_path
  end

end