class AddIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :created_at
  end
end
