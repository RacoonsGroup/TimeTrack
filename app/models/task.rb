class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :project, :real_time, :status, :time_points
end
