class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.boolean :bonus, null: false, default: false
      t.text :lyrics

      t.index :album_id
      t.timestamps
    end
  end
end
