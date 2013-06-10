class StatisticsAdminPresenter < StatisticsPresenter
  
  def initialize(user_id, params)
    @params = params

    user_id = params[:user_id] || user_id
    @time_entries = StatisticsFilter.new(user_id,params)
  end

  def selected_user
    selected_user = @params[:user_id]
  end

  def users
    users = User.all
    users.unshift(User.new(email: "all"))
  end
end
