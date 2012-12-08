class StatisticsController < ApplicationController

  def index
    user_id = current_user.admin? ? ( params[:user_id] || current_user.id ) : current_user.id

    @time_entries = TimeEntry.in_date_range(params[:from_date], params[:to_date], user_id).page(params[:page])
    if current_user.admin?
      @users = User.all
    end

    @real_time = @time_entries.collect(&:real_time).compact.sum
    @delivered_time = @time_entries.collect(&:time_points).compact.sum
  end
end
