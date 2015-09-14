class RemoveLikeIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :like_id
  end
end
