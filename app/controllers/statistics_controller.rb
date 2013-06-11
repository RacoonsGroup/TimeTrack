class StatisticsController < ApplicationController

  def index
    
    @presenter = current_user.admin? ? StatisticsAdminPresenter.new(params) : StatisticsPresenter.new(current_user.id,params)

    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end

  def download_pdf
    output = PdfReport.new.to_pdf(params[:from], params[:to])
    send_data output, :type => 'application/pdf', :filename => "#{Time.zone.now.strftime('%d %b %y')}"
  end

end
