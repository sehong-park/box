class EditStatusToOrders < ActiveRecord::Migration
  def change
    change_column :orders, :status, :integer, default: 0
  end
end
