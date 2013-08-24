class Api::ProjectsController < Api::ApplicationController
  def index
    render json: ::Project.pluck(:id, :project_name)
  end
end