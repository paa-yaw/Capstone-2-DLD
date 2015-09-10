class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes, id: :uiid do |t|
      t.references :artwork

      t.timestamps
    end
  end
end
