class AddStatusToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :permitted
    add_column :orders, :status, :integer
    add_index :orders, :status
  end
end
