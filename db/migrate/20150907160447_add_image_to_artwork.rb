class AddImageToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :image, :string
  end
end
