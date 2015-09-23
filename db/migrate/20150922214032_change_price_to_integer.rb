class ChangePriceToInteger < ActiveRecord::Migration
  def change
    change_column :artworks, :price, :integer
  end
end
