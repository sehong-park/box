class AddAnsweredToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :answered, :boolean, default: false
  end
end
