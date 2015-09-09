class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes, id: :uuid do |t|
      t.uuid :artwork_id, null: false, index: true
      t.timestamps
    end
  end
end
