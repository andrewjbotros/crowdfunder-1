class Users::ProjectsController < ApplicationController
  before_action :signin_required
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
  end

  def show
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_param)
    if @project.save
      @project.breakpoints.create(amount: 0, description: "No Reward")
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
      redirect_to user_projects_path(current_user)
    end
  end

private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_param
    params.require(:project).permit(:name, :description, :goal, :start_date, :finish_date, :tag_list)
  end

end