class CreateProprios < ActiveRecord::Migration
  def change
    create_table :proprios do |t|

      t.datetime :remember_created_at
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :street
      t.string :house_number
      t.string :flat_number
      t.string :city
      t.string :country
      t.string :zip_code

      t.timestamps null: false
    end
  end
end
