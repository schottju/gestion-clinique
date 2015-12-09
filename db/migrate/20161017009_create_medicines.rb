class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.text :description
      t.float :amount
      t.integer :grace_period
      t.float :price
      t.string :serial_number
      t.text :dosage
      t.references :unit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
