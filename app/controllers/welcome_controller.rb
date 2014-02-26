class WelcomeController < ApplicationController
  def index
    flash[:info] = "TEST"
    flash[:success] = "TEST"
    flash[:warning] = "TEST"
    flash[:danger] = "TEST"
  end
end