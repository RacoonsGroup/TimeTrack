class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.float :base_wage

      t.timestamps
    end
  end
end
