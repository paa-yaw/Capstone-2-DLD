class AddCategoryIdToArtwork < ActiveRecord::Migration
  def change
  	add_column :artworks, :category_id, :string
  end
end
