class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :chose
      t.string :info
    end
  end
end
