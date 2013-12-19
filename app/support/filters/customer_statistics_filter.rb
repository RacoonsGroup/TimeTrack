class CustomerStatisticsFilter < StatisticsFilter
  def filter
    te = super
  end

protected
  def by_visibility_for_customer(time_entry)
    if @params[:from_date].present?
      te = te.where("date >= ?", @params[:from_date].to_date)
    end
  end
end