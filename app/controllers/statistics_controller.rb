
class StatisticsController < ApplicationController

  def index

    #render text: params
    user_id = current_user.admin? ? ( params[:user_id] || current_user.id ) : current_user.id

    @from_date = params[:from_date]
    @to_date = params[:to_date]

    project_id = params[:project_id]

    @time_entries = TimeEntry.in_date_range(@from_date, @to_date,
                                            user_id, project_id).
                                            page(params[:page])
    if current_user.admin?
      @users = User.all
      @users.unshift(User.new(email: "all"))
    end

    @projects=Project.all
    @projects.unshift(Project.new(project_name: "all"))

    @real_time = TimeEntry.in_date_range(@from_date, @to_date,
                                         user_id, project_id).
                                         sum(:real_time)
    @delivered_time = TimeEntry.in_date_range(@from_date, @to_date,
                                              user_id, project_id).
                                              sum(:time_points)
    # Will be removed in latest versions
    #@month_hours = TimeEntry.month_hours
  end

  def download_pdf
    output = PdfReport.new.to_pdf(params[:from], params[:to])
    send_data output, :type => 'application/pdf', :filename => "#{Time.zone.now.strftime('%d %b %y')}"
  end

end
