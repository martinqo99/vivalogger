class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.integer :songs_count, default: 0

      t.timestamps
    end
    add_index :artists, :name
  end
end
