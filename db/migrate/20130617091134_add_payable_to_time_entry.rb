class AddPayableToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :payable, :boolean
  end
end
