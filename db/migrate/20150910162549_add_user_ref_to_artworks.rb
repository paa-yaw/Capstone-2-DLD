class AddUserRefToArtworks < ActiveRecord::Migration
  def change
    add_reference :artworks, :user, index: true
  end
end
