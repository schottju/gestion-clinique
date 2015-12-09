class AddStatusesToDictionaries < ActiveRecord::Migration
  def change
    add_column :treatments, :status, :integer, default: 0
    add_column :units, :status, :integer, default: 0
    add_column :species, :status, :integer, default: 0
    add_column :diseases, :status, :integer, default: 0
    add_column :medocs, :status, :integer, default: 0    
  end
end
