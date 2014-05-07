# encoding: utf-8

class ArticleMailer < ActionMailer::Base
  default from: "racoons.group@gmail.com"

  def new_article user, article
    @user = user
    @article = article
    recipients = User.approved.collect(&:email).join(',')
    mail(to: recipients, subject: "Добавлена статья")
  end

end
