class PledgesController < ApplicationController

  def new
    @breakpoint = Breakpoint.find(params[:breakpoint_id])
    @pledge = @breakpoint.pledges.new()
  end

  def create
    @pledge = Pledge.new(pledge_param)
    @pledge.user = current_user
    respond_to do |format|
      if @pledge.save
        format.html {
          flash[:success] = "Thank you so much for backing up this project"
          redirect_to @pledge.breakpoint.project
        }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def edit
    @pledge = Pledge.find(params[:id])
  end

  def update
    @pledge = Pledge.find(params[:id])
    if @pledge.update(pledge_param)
      flash[:success] = "Your pledge has been updated, thank you!"
      redirect_to @pledge.breakpoint.project
    else
      render :edit
    end
  end

  def destroy

  end

private

  def pledge_param
    params.require(:pledge).permit(:amount, :breakpoint_id)
  end

end