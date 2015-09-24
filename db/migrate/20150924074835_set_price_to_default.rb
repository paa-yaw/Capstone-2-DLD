class SetPriceToDefault < ActiveRecord::Migration
  def change
    change_column :artworks, :price, :float, :default => 0.00
  end
end
