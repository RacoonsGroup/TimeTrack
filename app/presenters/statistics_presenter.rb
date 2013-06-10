class StatisticsPresenter
  
  def initialize(user, params)
    @params = params
    @admin = user.admin?

    user_id = user.admin? ? ( params[:user_id] || user.id ) : user.id
    per_page = @params[:per] ? @params[:per].to_i : 25
    @time_entries = TimeEntry.in_range(user_id,params).page(params[:page]).per(per_page)
  end

  def selected_user
    if @admin
      selected_user = @params[:user_id]
    end
  end

  def selected_project
    selected_project = @params[:project_id]
  end

  def from_date
    from_date = @params[:from_date]
  end

  def to_date
    to_date = @params[:to_date]
  end

  def users
    if @admin
      users = User.all
      users.unshift(User.new(email: "all"))
    end
  end

  def projects
    projects=Project.all
    projects.unshift(Project.new(project_name: "all"))
  end

  def time_entries
    @time_entries
  end

  def real_time
    real_time = @time_entries.sum(:real_time)
  end

  def delivered_time
    delivered_time = @time_entries.sum(:time_points)
  end

end
