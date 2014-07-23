class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :span_time
      t.string :pickup_date
      t.string :pickup_location
      t.string :delivery_location
      t.text :box_description
      t.text :any_question
      t.string :knowing_route

      t.timestamps
    end
  end
end
