class AddDisableToProject < ActiveRecord::Migration
  def change
    add_column :projects, :disable, :boolean
  end
end
