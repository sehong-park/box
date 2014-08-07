class RemoveUnitInfoFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :unit_info
    add_column :orders, :units, :text
  end
end
