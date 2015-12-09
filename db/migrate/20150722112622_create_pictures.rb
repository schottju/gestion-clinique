class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.text :description
      t.string :image
      t.text :image_data
      t.references :proprio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
