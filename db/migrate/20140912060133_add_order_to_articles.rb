class AddOrderToArticles < ActiveRecord::Migration
  def change
    add_reference :articles, :order, index: true
  end
end
