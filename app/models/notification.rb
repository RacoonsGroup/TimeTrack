class Notification < ActiveRecord::Base
  attr_accessible :description, :end_date, :start_date, :title

  scope :current, -> { where("start_date <= '#{Time.zone.now}' AND end_date >= '#{Time.zone.now}'") }
end
