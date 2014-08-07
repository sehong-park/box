class RenameUnitsObjFromOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :units_hash, :units_info
  end
end
