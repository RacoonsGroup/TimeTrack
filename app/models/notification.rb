class Notification < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title

  scope :current, -> { where("start_date <= '#{Time.zone.now}' AND end_date >= '#{Time.zone.now}'") }

  after_create :notify_users

  def notify_users
    NotifyMailer.new_notify(self)
  end
end
