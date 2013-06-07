class StatisticsController < ApplicationController

  def index
  
    per_page= params[:per] ? params[:per].to_i : 25
    @time_entries = TimeEntry.in_range(current_user,params).page(params[:page]).per(per_page)
    
    @real_time = @time_entries.sum(:real_time)
    @delivered_time = @time_entries.sum(:time_points)


    @from_date = params[:from_date]
    @to_date = params[:to_date]
  
    @projects=Project.all
    @projects.unshift(Project.new(project_name: "all"))
  
    if current_user.admin?
      @users = User.all
      @users.unshift(User.new(email: "all"))
    end
    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end

  def download_pdf
    output = PdfReport.new.to_pdf(params[:from], params[:to])
    send_data output, :type => 'application/pdf', :filename => "#{Time.zone.now.strftime('%d %b %y')}"
  end

end
