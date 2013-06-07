#set :output, File.join(Whenever.path, "log", "cron.log")

#every 2.minutes do # every 1.day, at: '23:30 pm'
  #command echo 'Awesome'
  #runner "ReportMailer.report_to_admin.deliver"
  #runner "ReportMailer.report_to_admin"
  #command "echo 'Second awesome' >> /home/sergey/rails_projects/test.txt"
end
