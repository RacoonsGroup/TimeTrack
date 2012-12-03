class StatisticController < InheritedResources::Base
  action :index
  def index
    TimeEntry.all
  end
end