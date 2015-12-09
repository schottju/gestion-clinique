class ChangeColumnSourceInImages < ActiveRecord::Migration
  def change
    change_column :images, :source, :text
  end
end
