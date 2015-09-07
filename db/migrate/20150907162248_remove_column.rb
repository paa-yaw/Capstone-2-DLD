class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :artworks, :caption
  end
end
