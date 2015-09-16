class RemoveCountclicksFromArtworks < ActiveRecord::Migration
  def change
    remove_column :artworks, :countclicks
  end
end
