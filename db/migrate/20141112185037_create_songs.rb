class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.references :artist, index: true
      t.string :title, null: false
      t.integer :plays_count, default: 0

      t.timestamps
    end
    add_index :songs, :title
  end
end
