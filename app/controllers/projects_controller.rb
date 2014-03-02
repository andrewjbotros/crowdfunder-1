class ProjectsController < ApplicationController

  def index
    if params[:tag]
      @projects = Project.tagged_with(params[:tag]).active
    else
      @projects = Project.active
    end
  end

  def show
    @project = Project.find(params[:id])
    @breakpoints = @project.breakpoints
  end

end
