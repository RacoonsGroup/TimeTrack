class EditTimeController < ApplicationController
  def update
    time_entry = TimeEntry.find(params[:edit_time][:id])
    time_entry.update(time_points: params[:edit_time][:time_points])
    render nothing:true
  end
end
