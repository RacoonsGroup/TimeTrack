class Project < ActiveRecord::Base
  attr_accessible :project_name, :project_description, :disable
  has_many :time_entries
end
