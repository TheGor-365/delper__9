class ProjectsController < ApplicationController
  before_action :authenticate_account!

  def index
    @technology = Technology.find(params[:technology_id])
    @technologies = Technology.all
    @projects = @technology.projects.all
  end

  def show
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.projects.all
    @project = Project.find(params[:id])
  end

  def new
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
  end

  def create
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @technology.projects.create(project_params)

    redirect_to technology_projects_path(@technology)
  end

  def edit
    @technologies = Technology.all
    @technology = Technology.find(params[:technology_id])
    @projects = @technology.projects.all
    @project = Project.find(params[:id])
  end

  def update
    @technology = Technology.find(params[:technology_id])
    @projects = @technology.projects.all

    if @technology.projects.update(project_params)
      redirect_to technology_projects_path(@technology)
    else
      render action: 'edit'
    end
  end

  def destroy
    @technology = Technology.find(params[:technology_id])
    @questions = @technology.projects
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to technology_projects_path
  end

  private
  def project_params
    params.require(:project).permit(:title, :body)
  end
end
