class TimeEntriesController < ApplicationController
   
  def index
	TimeEntry.all
  end
end