class Qualification < ActiveRecord::Base
  has_many :users

  #attr_accessible :base_wage, :name
end
