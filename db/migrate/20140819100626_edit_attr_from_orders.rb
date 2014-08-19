class EditAttrFromOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :agree, :terms_of_service
  end
end
