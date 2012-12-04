class TimeEntry < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :name, :project, :real_time, :status, :time_points, :date

  STATUSES = %w(finished processing)


  validates :name, :user_id, :project, :real_time, :status, presence: true
  validates :name, length: { maximum: 255 }
  validates :project, length: { maximum: 100 }
  validates :real_time, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :time_points, numericality: true, allow_blank: true
  validates :date, presence: true


  def self.in_date_range(from, to, user_id)
    if from.present && to.present
        TimeEntry.where(user_id: user_id, date: [(from.to_date)..(to.to_date)])
    else
        TimeEntry.where(user_id: user_id)
    end
  end
end
