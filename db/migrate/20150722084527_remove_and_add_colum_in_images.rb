class RemoveAndAddColumInImages < ActiveRecord::Migration
  def change
    remove_column :images, :source
    add_column :images, :image, :string
  end
end
