class AddUnitInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :unit_info, :string
  end
end
