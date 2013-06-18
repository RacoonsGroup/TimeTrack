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

  def payment_type_statistics
    array = @time_entries.filter
 
    internal_tasks = array.where(project_id: Project.where(payment_type: 'internal'))
    point_tasks = array.where(project_id: Project.where(payment_type: 'point'))
    level_tasks = array.where(project_id: Project.where(payment_type: 'level'))
    
    payment_statatistics=[]

    if internal_tasks.present?
      payment_statatistics.push({ payment_type: :internal, 
                                  real_time: internal_tasks.sum(:real_time), 
                                  delivred_time: internal_tasks.sum(:time_points), 
                                  rate: internal_tasks.sum(:time_points)/internal_tasks.sum(:real_time)})
    end
    
    if point_tasks.present?
       payment_statatistics.push({ payment_type: :point, 
                                   real_time: point_tasks.sum(:real_time), 
                                   delivred_time: point_tasks.sum(:time_points), 
                                   rate: point_tasks.sum(:time_points)/point_tasks.sum(:real_time)})
    end     

    if level_tasks.present?
      payment_statatistics.push({ payment_type: :level, 
                                  real_time: level_tasks.sum(:real_time), 
                                  delivred_time: level_tasks.sum(:time_points), 
                                  rate: level_tasks.sum(:time_points)/level_tasks.sum(:real_time)})
    end
    payment_statatistics
  end

  def projects
    projects = ProjectsFilter.new.filter
    projects.unshift(Project.new(project_name: "all"))
  end

  def payable
    payable = [['All',''], ['True', :true], ['False', :false], ['Nil', :nil]]    
  end
  def selected_payable
    @params[:payable]
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
