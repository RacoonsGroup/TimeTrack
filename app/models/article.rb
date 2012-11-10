class Article < ActiveRecord::Base
  attr_accessible :importance, :short_description, :title

  has_and_belongs_to_many :users

  validates :title, :short_description, :importance, presence: true
  validates :importance, inclusion: { in: 1..5 }
end
