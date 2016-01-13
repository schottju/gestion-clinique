class CreateHospitsHospitactesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hospits, :hospitactes do |t|
      t.index :hospitacte_id
      t.index :hospit_id
    end
  end
end
