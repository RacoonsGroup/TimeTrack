class StatisticsController < ApplicationController

  def index
    
    @presenter = current_user.admin? ? StatisticsAdminPresenter.new(params) : StatisticsPresenter.new(current_user.id,params)

    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end

  def download
    filename = "report-#{params[:from_date]||Date.today}-#{params[:to_date]}.#{params[:format]}"
    output = respond_to do |format|
      format.pdf {
        PdfReport.new.to_pdf(params[:from_date], params[:to_date])
      }
      format.xls {
        XlsReport.new(params).get_xls
      }
    end
    send_data(output, filename: filename)
  end

end
