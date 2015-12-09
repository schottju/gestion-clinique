class CreateVeterinarians < ActiveRecord::Migration
  def change
    create_table :veterinarians do |t|
      t.string :title
      t.string :specialization
      t.integer :pwz
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
