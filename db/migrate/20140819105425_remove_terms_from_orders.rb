class RemoveTermsFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :terms_of_service
  end
end
