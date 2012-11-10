class Article < ActiveRecord::Base
  attr_accessible :rating, :short_description, :title

  has_and_belongs_to_many :users

  validates :title, :short_description, :rating, presence: true
end
