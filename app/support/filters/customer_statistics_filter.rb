class CustomerStatisticsFilter < StatisticsFilter

  def initialize(customer,params)
    @params = params
    @customer = customer
  end

  def filter
    te = TimeEntry.where(project_id: @customer.project_id, is_visible_for_customer: true).order('date desc')

    te=by_user(te)
    te=by_project(te)
    te=by_date(te)
    te=by_payable(te)

    te
  end

protected
  def by_visibility_for_customer(te)
    if @params[:by_visibility_for_customer].present?
      te = te.where(is_visible_for_customer: true)
    end
    te
  end
end