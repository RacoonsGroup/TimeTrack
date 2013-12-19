class SetVisibilityForCustomers < ActiveRecord::Migration
  def up
    TimeEntry.all.each do |te|
      te.update_attributes(is_visible_for_customer: true) if te.time_points.present?
    end
  end

  def down
    TimeEntry.all.each do |te|
      te.update_attributes(is_visible_for_customer: false)
    end
  end
end
