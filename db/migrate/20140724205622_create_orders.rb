class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :num_boxes
      t.integer :weeks_storage
      t.integer :charge
      t.string :location_pickup
      t.string :location_delivery
      t.text :description
      t.text :any_question

      t.timestamps
    end
    add_index :orders, [:user_id, :created_at]
  end
end
