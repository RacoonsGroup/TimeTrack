class AddDateToTimeEntries < ActiveRecord::Migration
  def up
    add_column :time_entries, :date, :date
    say_with_time "Updating dates..." do
      TimeEntry.find(:all).each do |entry|
        entry.update_attribute :date, entry.created_at
      end
    end
  end

  def down
    remove_columnt :time_entries, :date
  end
end
