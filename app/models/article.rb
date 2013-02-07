class Article < ActiveRecord::Base
  attr_accessible :importance, :short_description, :title, :url

  has_and_belongs_to_many :users

  validates :title, :short_description, :importance, :url, presence: true
  validates :importance, inclusion: { in: 1..5 } 

  def read_by? user
    users.where(id: user.id).any?
  end

  def toggle_read user
    if read_by? user
      unread_by! user
    else
      read_by! user
    end
  end

  def unread_by! user
    users.delete(user)
  end

  def read_by! user
    users << user
  end
end
