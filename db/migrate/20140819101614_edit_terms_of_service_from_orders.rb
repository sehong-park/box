class EditTermsOfServiceFromOrders < ActiveRecord::Migration
  def change
    change_column :orders, :terms_of_service, :boolean, default: false
  end
end
