# encoding: utf-8

class TimeEntryMailer < ActionMailer::Base
  default from: "racoons.group@gmail.com"

  def new_time_entry(time_entry)
    @time_entry = time_entry
    admins = User.where(role: 'admin')
    recipients = admins.collect(&:email).join(',')
    mail(to: recipients, subject: "Добавлен Time Entry #{time_entry.user_email}")
  end

end
