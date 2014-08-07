class EditUnitsFromOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :units, :units_hash
  end
end
