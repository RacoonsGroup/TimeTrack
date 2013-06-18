class AddQualificationIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :qualification_id, :integer
  end
end
