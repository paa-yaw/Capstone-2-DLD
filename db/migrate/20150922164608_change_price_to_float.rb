class ChangePriceToFloat < ActiveRecord::Migration
  def change
    change_column :artworks, :price, :float
  end
end
