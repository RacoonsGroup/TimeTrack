class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :short_description
      t.integer :rating

      t.timestamps
    end
  end
end
