class RenameViewsToCountclicks < ActiveRecord::Migration
  def change
    rename_column :artworks, :views, :countclicks
  end
end
