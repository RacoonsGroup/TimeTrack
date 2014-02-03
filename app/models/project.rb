class Project < ActiveRecord::Base
  #attr_accessible :project_name, :project_description, :payment_type, :disable
  has_many :time_entries

  TYPES = %w(point level internal)

  validates :payment_type, inclusion: { in: TYPES }
end
