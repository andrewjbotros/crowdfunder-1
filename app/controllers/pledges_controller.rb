class PledgesController < ApplicationController

  def new
    @pledge = project.pledges.new
  end

  def create
    @pledge = current_user.pledges.new(pledge_param)
    if @pledge.save
      flash[:success] = "Thank you so much for backing up this project"
      redirect_to @pledge.project
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end