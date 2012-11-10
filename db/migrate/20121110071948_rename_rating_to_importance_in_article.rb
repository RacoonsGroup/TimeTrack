class RenameRatingToImportanceInArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :rating, :importance
  end
end
