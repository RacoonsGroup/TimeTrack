class TimeEntry < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :description, :name, :project, :real_time, :status, :time_points, :date , :project_id, :url

  STATUSES = %w(finished processing)

  validates :name, :user_id, :project, :real_time, :status, presence: true
  validates :name, length: { maximum: 255 }
  validates :project, length: { maximum: 100 }
  validates :real_time, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: STATUSES }
  validates :time_points, numericality: true, allow_blank: true
  validates :date, presence: true


  class << self
    def in_range(user,params)
      te = TimeEntry.order('date desc')
      
      user_id = user.admin? ? ( params[:user_id] || user.id ) : user.id
      
      if user_id.present?
        te = te.where(user_id: user_id)
      end

      if params[:project_id].present?
        te = te.where(project_id: params[:project_id])
      end

      if params[:from_date].present?
        te = te.where("date >= ?", params[:from_date].to_date)
      end

      if params[:to_date].present?
        te = te.where("date <= ?", params[:to_date].to_date)
      end
      te
    end

    def month_hours
      mb = Date.today.at_beginning_of_month
      me = Date.today.at_end_of_month
      TimeEntry.where(date: (mb..me)).sum("real_time")
    end
  end

  def project_name
    project_id ? project.project_name : project
  end
end
