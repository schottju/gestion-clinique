class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :source
      t.text :description
      t.references :medical_record, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
