class CreatePropriosContactsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :proprios, :contacts do |t|
      t.index :contact_id
      t.index :proprio_id
    end
  end
end
