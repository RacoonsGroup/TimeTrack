class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :project
      t.string :name
      t.float :real_time
      t.float :time_points
      t.string :status
      t.text :description

      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
