class AddPermittedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :permitted, :boolean, default: false
  end
end
