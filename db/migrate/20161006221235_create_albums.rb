class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.boolean :studio, null: false, default: false

      t.index :band_id
      t.timestamps
    end
  end
end
