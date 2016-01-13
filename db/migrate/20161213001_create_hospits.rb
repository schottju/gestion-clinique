class CreateHospits < ActiveRecord::Migration
  def change
    create_table :hospits do |t|
      t.text :anamnesis
      t.text :description
      t.text :comment
      t.string :poids
      t.references :proprio, index: true, foreign_key: true
      t.references :veterinarian, index: true, foreign_key: true
      t.float :addictional_cost
      t.float :total_cost

      t.timestamps null: false
    end
  end
end
