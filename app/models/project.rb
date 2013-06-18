class Project < ActiveRecord::Base
  attr_accessible :project_name, :project_description, :type, :disable
  has_many :time_entries

  TYPES = %w(point level internal)

  validates :type, inclusion: { in: TYPES }
end
