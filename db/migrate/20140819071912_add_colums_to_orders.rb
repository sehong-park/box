class AddColumsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pikcup_location, :integer
    add_column :orders, :delivery_location, :integer
  end
end
