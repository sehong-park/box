class AddContentToUnits < ActiveRecord::Migration
  def change
    add_column :units, :content, :string
  end
end
