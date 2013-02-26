class AddIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :title
    add_index :articles, :short_description
    add_index :articles, :url
  end
end