# encoding: utf-8

class TimeEntryMailer < ActionMailer::Base
  default from: "racoons.group@gmail.com"

  def new_time_entry(user,time_entry)
    @user = user
    @time_entry = time_entry
    admins = User.where(role: 'admin')
    recipients = admins.collect(&:email).join(',')
    mail(to: recipients, subject: "Добавлен Time Entry #{user.email}")
  end

end
