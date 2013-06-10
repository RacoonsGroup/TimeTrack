class StatisticsPresenter
  
  def initialize(user, params)
    
    @user=user
    @params=params

  end

  def selected_user
    @selected_user = @params[:user_id]
  end

  def selected_project
    @selected_project = @params[:project_id]
  end

  def from_date
    from_date = @params[:from_date]
  end

  def to_date
    to_date = @params[:to_date]
  end

  def users
    if @user.admin?
      @users = User.all
      @users.unshift(User.new(email: "all"))
    end
  end

  def projects
    @projects=Project.all
    @projects.unshift(Project.new(project_name: "all"))
  end

  def time_entries
    per_page = @params[:per] ? params[:per].to_i : 25
    @time_entries = TimeEntry.in_range(@user,@params).page(@params[:page]).per(per_page)
  end

  def real_time
    @real_time = @time_entries.sum(:real_time)
  end

  def delivered_time
    @delivered_time = @time_entries.sum(:time_points)
  end

end
