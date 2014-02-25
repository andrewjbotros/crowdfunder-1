class BreakpointsController < ApplicationController

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @breakpoint = @project.breakpoints.new
  end

  def create
    @project = Project.find(params[:project_id])
    @breakpoint = @project.breakpoints.new(breakpoint_params)
    if @breakpoint.save
      flash[:success] = "Breakpoint has been created"
      redirect_to @project
    else
      render :new
    end
  end

  def edit
    @breakpoint = Breakpoint.find(params[:id])

  end

  def update
    @breakpoint = Breakpoint.find(params[:id])
    if @breakpoint.update(breakpoint_params)
      flash[:success] = "Breakpoint has been updated"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @breakpoint = Breakpoint.find(params[:id])
    @project = @breakpoint.project
    @breakpoint.destroy
    redirect_to @project
  end

end