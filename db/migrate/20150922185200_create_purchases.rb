class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :artwork, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
