#set :output, File.join(Whenever.path, "log", "cron.log")

every 4.minutes do # every 1.day, at: '23:30 pm'
  #command "echo 'Awesome' >> /home/sergey/rails_projects/test.txt"
  runner "ReportMailer.report_to_admin.deliver"
  #runner "ReportMailer.report_to_admin"
  #command "echo 'Second awesome' >> /home/sergey/rails_projects/test.txt"
end
