class ProjectsController < ApplicationController
  before_action :signin_required, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = current_user.projects.new
    @project.breakpoints.build(amount: 0, description: "No Reward")
  end

  def create
    @project = current_user.projects.new(project_param)
    if @project.save
      flash[:success] = "Project has been created successfully"
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_param)
      flash[:success] = "Project has been updated successfully"
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:success] = "Project has been removed"
      redirect_to current_user
    end
  end

private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_param
    params.require(:project).permit(:name, :description, :goal, :start_date, :finish_date)
  end

  def signin_required
    unless signed_in?
      flash[:info] = "Please signin first thank you!"
      redirect_to :signin
    end
  end

end
