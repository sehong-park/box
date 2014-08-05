class AddOrderIdToUnits < ActiveRecord::Migration
  def change
    add_column :units, :order_id, :integer
    add_index :units, :order_id
  end
end
