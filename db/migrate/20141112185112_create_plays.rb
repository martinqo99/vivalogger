class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.references :song, index: true
      t.datetime :at, null: false
    end
  end
end
