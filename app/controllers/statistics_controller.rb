class StatisticsController < ApplicationController

  def index
    user_id = current_user.admin? ? ( params[:user_id] || current_user.id ) : current_user.id

    @time_entries = TimeEntry.in_date_range(params[:from_date], params[:to_date], user_id)
    if current_user.admin?
      @users = User.all
    end

    @real_time = @time_entries.sum(:real_time)
    @delivered_time = @time_entries.sum(:time_points)
    @time_entries = @time_entries.page(params[:page])
  end
end
