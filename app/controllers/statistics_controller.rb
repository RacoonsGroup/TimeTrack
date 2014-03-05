class StatisticsController < ApplicationController

  def index
    @presenter = if current_user.admin?
                   StatisticsAdminPresenter.new(params)
                 elsif current_user.type == 'Customer'
                   StatisticsCustomerPresenter.new(current_user, params)
                 else
                   StatisticsPresenter.new(current_user.id,params)
                 end

    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end



  def download
    filename = "report-#{params[:from_date]||Date.today}-#{params[:to_date]}.#{params[:format]}"
    output = respond_to do |format|
      format.pdf {
        PdfReport.new.to_pdf(params)
      }
      format.xls {
        XlsReport.new(params).get_xls
      }
    end
    send_data(output, filename: filename)
  end

end
