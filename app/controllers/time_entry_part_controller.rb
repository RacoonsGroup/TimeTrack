class TimeEntryPartController < ApplicationController
  def update
    time_entry = TimeEntry.find(params[:time_entry][:id])
    if params[:time_entry][:time_points]
      time_entry.update(time_points: params[:time_entry][:time_points])
    end
    if params[:time_entry][:payable]
      time_entry.update(payable: params[:time_entry][:payable])
    end
    render nothing:true
  end
end
