class AddAgreeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :agree, :boolean
  end
end
