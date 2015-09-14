class ReversePreviousMigration < ActiveRecord::Migration
  def change
    remove_column :likes, :user_id
    add_column :users, :like_id, :integer
  end
end
