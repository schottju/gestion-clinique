class CreateHospitsAnimalsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :hospits, :animals do |t|
      t.index :hospit_id
      t.index :animal_id
    end
  end
end
