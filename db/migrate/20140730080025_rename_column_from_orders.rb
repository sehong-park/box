class RenameColumnFromOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :num_boxes, :unit_count
    rename_column :orders, :weeks_storage, :store_weeks
    rename_column :orders, :location_pickup, :pickup_address
    rename_column :orders, :location_delivery, :delivery_address
    rename_column :orders, :description, :why_ordering
    rename_column :orders, :any_question, :question
  end
end