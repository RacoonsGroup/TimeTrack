class StatisticsCustomerPresenter < StatisticsPresenter

  def initialize(customer, params)
    params[:project_id] = customer.project_id
    params[:is_visible_for_customer] = true
    @params = params
    @customer = customer

    @time_entries = CustomerStatisticsFilter.new(customer,params)
  end

  def selected_user
    @params[:user_id]
  end

  def users
    users = User.approved
    users.unshift(User.new(email: "all"))
  end

  def selected_project
    [@customer.project_id]
  end

  def projects
    projects = [@customer.project]
  end

end