class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :num
      t.text :comment
      t.references :veterinarian, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
