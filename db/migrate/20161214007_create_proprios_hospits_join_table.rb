class CreatePropriosHospitsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :proprios, :hospits do |t|
      t.index :proprio_id
      t.index :hospit_id
    end
  end
end
