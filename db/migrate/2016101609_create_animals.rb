class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :id_number
      t.string :name
      t.date :birth_date
      t.integer :amount
      t.float :weight
      t.integer :gender
      t.float :age
      t.text :description

      t.timestamps null: false
    end
  end
end
