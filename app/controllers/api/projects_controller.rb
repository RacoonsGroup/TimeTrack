class Api::ProjectsController < Api::ApplicationController
  def index
    render json: ::Project.select([:id, :project_name])
  end
end