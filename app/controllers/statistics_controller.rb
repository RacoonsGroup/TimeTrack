class StatisticsController < ApplicationController

  def index
    user_id = current_user.admin? ? ( params[:user_id] || current_user.id ) : current_user.id

    @from_date = params[:from_date]
    @to_date = params[:to_date]
    @time_entries = TimeEntry.in_date_range(@from_date,
                                            @to_date, user_id).
                                            page(params[:page])
    if current_user.admin?
      @users = User.all
      @users.unshift(User.new(email: "all"))
    end

    @real_time = TimeEntry.in_date_range(@from_date,
                                         @to_date, user_id).
                                         sum(:real_time)
    @delivered_time = TimeEntry.in_date_range(@from_date,
                                              @to_date, user_id).
                                              sum(:time_points)

    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end
end
