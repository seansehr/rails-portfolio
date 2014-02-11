class ProjectsController < ApplicationController
  def create
    @project = Project.new(project_params)
    flash[:notice] = "Project has been created."
    redirect_to @project
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
