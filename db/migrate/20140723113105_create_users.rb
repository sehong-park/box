class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :birthday
      t.string :knowing_route

      t.timestamps
    end
  end
end
