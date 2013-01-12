class StatisticsController < ApplicationController

  def index
    user_id = current_user.admin? ? ( params[:user_id] || current_user.id ) : current_user.id

    @from_date = params[:from_date]
    @to_date = params[:to_date]

    @time_entries = TimeEntry.in_date_range(@from_date,
                                            @to_date, user_id).
                                           paginate(:page => params[:page],
                                                   :per_page => 15)
    if current_user.admin?
      @users = User.all
    end

    @real_time = @time_entries.sum(:real_time)
    @delivered_time = @time_entries.sum(:time_points)

    @month_hours = TimeEntry.month_hours
  end
end
