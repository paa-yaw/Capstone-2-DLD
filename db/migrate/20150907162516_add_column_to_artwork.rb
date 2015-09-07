class AddColumnToArtwork < ActiveRecord::Migration
  def change
  	add_column :artworks, :caption, :string
  end
end
