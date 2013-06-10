class StatisticsFilter
  
  def initialize
  end

  def filter(user_id,params)
    te = TimeEntry.order('date desc')

    if user_id.present?
      te = te.where(user_id: user_id)
    end

    if params[:project_id].present?
      te = te.where(project_id: params[:project_id])
    else
      pr=ProjectsFilter.new.filter
      te = te.where(project_id: pr)
    end

    if params[:from_date].present?
      te = te.where("date >= ?", params[:from_date].to_date)
    end

    if params[:to_date].present?
      te = te.where("date <= ?", params[:to_date].to_date)
    end
    te    
  end


end
