class AddViewsColumnToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :views, :integer
  end
end
