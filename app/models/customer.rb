class Customer < User
  belongs_to :project

  #attr_accessible :project_id
end