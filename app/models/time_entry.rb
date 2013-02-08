class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :name, :project, :real_time, :status, :time_points, :date , :project_id

  STATUSES = %w(finished processing)

  validates :name, :user_id, :project, :real_time, :status, presence: true
  validates :name, length: { maximum: 255 }
  validates :project, length: { maximum: 100 }
  validates :real_time, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :time_points, numericality: true, allow_blank: true
  validates :date, presence: true


  def self.in_date_range(from, to, user_id)
    te = TimeEntry.order('date desc')
    unless user_id == ''
      te = te.where(user_id: user_id)
    end
    if from.present?
      te = te.where("date >= ?", from.to_date)
    end
    if to.present?
      te = te.where("date <= ?", to.to_date)
    end
    te
  end

  def self.month_hours
    mb = Date.today.at_beginning_of_month
    me = Date.today.at_end_of_month
    TimeEntry.where(date: (mb..me)).sum("real_time")
  end

end
