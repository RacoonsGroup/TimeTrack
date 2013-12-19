class AddIsVisibleForCustomerToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :is_visible_for_customer, :boolean, default: false
  end
end
