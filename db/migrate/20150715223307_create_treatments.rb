class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.string :name
      t.text :description
      t.float :cost

      t.timestamps null: false
    end
  end
end
