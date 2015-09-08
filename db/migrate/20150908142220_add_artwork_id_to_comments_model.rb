class AddArtworkIdToCommentsModel < ActiveRecord::Migration
  def change
  	add_column :comments, :artwork_id, :string
  end
end
