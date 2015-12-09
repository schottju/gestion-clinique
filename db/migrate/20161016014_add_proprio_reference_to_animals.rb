class AddProprioReferenceToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :proprio, index: true, foreign_key: true
  end
end
