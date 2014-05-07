# encoding: utf-8

class NotifyMailer < ActionMailer::Base
  default from: "contact@racoons-group.com"

  def new_notify notify
    @notify = notify
    recipients = User.approved.collect(&:email).join(',')
    mail(to: recipients, subject: "Добавлена оповещалка")
  end

end
