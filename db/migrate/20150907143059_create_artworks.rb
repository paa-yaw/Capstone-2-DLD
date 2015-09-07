class CreateArtworks < ActiveRecord::Migration
  def change
  	enable_extension 'uuid-ossp'
  	
    create_table :artworks, id: :uuid do |t|
      t.string :caption, null: false
      t.text :description

      t.timestamps
    end
  end
end
