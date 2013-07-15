class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :name, :project, :real_time, :status, :time_points, :date , :project_id, :url, :payable

  STATUSES = %w(finished processing)

  validates :name, :user_id, :project, :real_time, :status, presence: true
  validates :name, length: { maximum: 255 }
  validates :project, length: { maximum: 100 }
  validates :real_time, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :time_points, numericality: true, allow_blank: true
  validates :date, presence: true


  delegate :email, to: :user, prefix: true, allow_nil: true


  class << self
    def month_hours
      mb = Date.today.at_beginning_of_month
      me = Date.today.at_end_of_month
      TimeEntry.where(date: (mb..me)).sum("real_time")
    end
  end

  def project_name
    project_id ? project.project_name : project
  end

  def coeff
    return (time_points / real_time).round(2) unless (time_points.nil? or real_time.nil?)
  end
end
