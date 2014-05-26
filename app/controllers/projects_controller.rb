class ProjectsController < ApplicationController
  include Pundit
  protect_from_forgery

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      format.html do
        if @project.save
          flash[:notice] = "Project has been created."
          redirect_to @project
        else
          flash[:alert] = "Project could not be saved."
          render :new
        end
      end
      format.js do
        unless @project.save
          render text: @project.errors.full_messages.join, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    project = @project
    @project.destroy
    flash[:notice] = "#{project.name} has been deleted."
    redirect_to projects_url
  end

  def edit
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @comment = Comment.new
    @commentable = @project
    @comments = @commentable.comments
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      flash.now[:error] =  "Project could not be saved."
      render :new
    end
  end

  private
  def project_params
    params.require(:project).permit(*policy(@project || Project).permitted_attributes)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
