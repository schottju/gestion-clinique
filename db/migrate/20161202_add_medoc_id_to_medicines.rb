class AddMedocIdToMedicines < ActiveRecord::Migration
  def change
      add_reference :medicines, :medoc, index: true, foreign_key: true
    end
end
