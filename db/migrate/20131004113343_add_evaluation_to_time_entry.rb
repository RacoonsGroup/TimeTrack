class AddEvaluationToTimeEntry < ActiveRecord::Migration
  def change
  	add_column :time_entries, :evaluation, :string
  end
end
