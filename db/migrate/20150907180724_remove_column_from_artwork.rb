class RemoveColumnFromArtwork < ActiveRecord::Migration
  def change
  	remove_column :artworks, :image, :string
  end
end
