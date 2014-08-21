class AddExtraCheckedToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :extra_checked, :boolean
  end
end
