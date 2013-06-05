class AddUrlToTimeEntry < ActiveRecord::Migration
  def change
    add_column :time_entries, :url, :string
  end
end
