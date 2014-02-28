class BreakpointsController < ApplicationController
  before_action :signin_required, except: [:show]
  before_action :find_project
  before_action :set_breakpoint, only: [:edit, :update, :destroy]

  def new
    @breakpoint = @project.breakpoints.new
  end

  def create
    @breakpoint = @project.breakpoints.new(breakpoint_params)
    if @breakpoint.save
      flash[:success] = "Breakpoint has been created"
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @breakpoint.update(breakpoint_params)
      flash[:success] = "Breakpoint has been updated"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @breakpoint.destroy
    redirect_to @project
  end

private

  def find_project
    @project = Project.find(params[:project_id])
    unless self?(@project.owner)
      flash[:info] = "You are not authroized to perform the action"
    end
  end

  def set_breakpoint
    @breakpoint = @project.breakpoints.find(params[:id])
  end

  def breakpoint_params
    params.require(:breakpoint).permit(:amount, :description)
  end

end