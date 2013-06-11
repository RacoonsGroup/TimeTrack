class StatisticsAdminPresenter < StatisticsPresenter
  
  def initialize(params)
    @params = params

    @time_entries = StatisticsFilter.new(params[:user_id],params)
  end

  def selected_user
    @params[:user_id]
  end

  def users
    users = User.all
    users.unshift(User.new(email: "all"))
  end
end
