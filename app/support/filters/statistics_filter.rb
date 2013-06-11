class StatisticsFilter
  
  def initialize(user_id,params)
    @user_id = user_id
    @params = params
  end

  def filter
    te = TimeEntry.order('date desc')

    te=by_user(te)
    te=by_project(te)
    te=by_date(te)

    te
  end

  def real_time
    filter.sum(:real_time)
  end

  def time_points
    filter.sum(:time_points)
  end

  protected
    def by_user(te)
      if @user_id.present?
        te = te.where(user_id: @user_id)
      end
      te
    end

    def by_project(te)
      if @params[:project_id].present?
        te = te.where(project_id: @params[:project_id])
      end
      te
    end

    def by_date(te)
      if @params[:from_date].present?
        te = te.where("date >= ?", @params[:from_date].to_date)
      end

      if @params[:to_date].present?
        te = te.where("date <= ?", @params[:to_date].to_date)
      end
      te
    end

end
