class CreateSearchas < ActiveRecord::Migration
  def change
    create_table :searchas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
