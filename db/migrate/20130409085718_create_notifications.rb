class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
