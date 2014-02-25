class TimePointsController < ApplicationController
  def update
    time_entry = TimeEntry.find(params[:time_points_form][:id])
    time_entry.update(time_points: params[:time_points_form][:time_points])
    render nothing:true
  end
end
