class EditColumFromOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :pikcup_location, :pickup_location
  end
end
