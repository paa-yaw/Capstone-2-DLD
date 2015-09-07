class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid do |t|
      t.text :content

      t.timestamps
    end
  end
end
