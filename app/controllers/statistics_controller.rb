class StatisticsController < ApplicationController

  def index
    user_id = current_user.admin? ? ( params[:user_id] or current_user.id ) : current_user.id
    from = params[:from_date]
    to = params[:to_date]
    @time_entries = TimeEntry.in_date_range(from, to, user_id)
    #render :text => from + " " + to
  end
end