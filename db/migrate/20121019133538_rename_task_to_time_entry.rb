class RenameTaskToTimeEntry < ActiveRecord::Migration
  def change
    rename_table :tasks, :time_entries
  end
end
