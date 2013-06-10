class StatisticsPresenter
  
  def initialize(user_id, params)
    @params = params

    @time_entries = StatisticsFilter.new(user_id,params)
  end

  def selected_project
    @params[:project_id]
  end

  def from_date
    @params[:from_date]
  end

  def to_date
    @params[:to_date]
  end

  def projects
    projects = ProjectsFilter.new.filter
    projects.unshift(Project.new(project_name: "all"))
  end

  def time_entries
    per_page = @params[:per] ? @params[:per].to_i : 25
    Kaminari.paginate_array(@time_entries.filter).page(@params[:page]).per(per_page)
  end

  def real_time
    @time_entries.real_time
  end

  def delivered_time
    @time_entries.time_points
  end

end
