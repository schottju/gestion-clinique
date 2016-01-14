class RemoveColumInMedicines < ActiveRecord::Migration
  def change
    remove_column :medicines, :amount
    remove_column :medicines, :price
    remove_column :medicines, :grace_period
  end
end
