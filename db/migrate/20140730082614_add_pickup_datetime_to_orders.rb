class AddPickupDatetimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pickup_datetime, :datetime
    add_column :orders, :delivery_datetime, :datetime
    
    add_index :orders, :pickup_datetime
    add_index :orders, :delivery_datetime
  end
end
