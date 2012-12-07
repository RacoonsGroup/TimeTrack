class StatisticsController < ApplicationController

  def index
    @user_id = current_user.admin? ? ( params[:user_id] or current_user.id ) : current_user.id
    @from = params[:from_date]
    @to = params[:to_date]

    @page = params[:page] or 1
    @time_entries = TimeEntry.in_date_range(@from, @to, @user_id).page(@page)
    if current_user.admin?
      @users = User.all
    end
    #TODO: SQL count?
    @real_time = TimeEntry.all.collect(&:real_time).sum
    @delivered_time = TimeEntry.all.collect(&:time_points).sum
  end
end
