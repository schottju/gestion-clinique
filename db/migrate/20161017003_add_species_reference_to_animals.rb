class AddSpeciesReferenceToAnimals < ActiveRecord::Migration
  def change
    add_reference :animals, :species, index: true, foreign_key: true
  end
end
