class AddStatutToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :statut, :integer, default: 0
  end
end
