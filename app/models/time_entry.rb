class TimeEntry < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :project, :real_time, :status, :time_points

  STATUSES = %w(finished processing)


  validates :name, :user_id, :project, :real_time, :status, presence: true
  validates :name, length: { maximum: 255 }
  validates :project, length: { maximum: 100 }
  validates :real_time, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :time_points, numericality: true, allow_blank: true


end
