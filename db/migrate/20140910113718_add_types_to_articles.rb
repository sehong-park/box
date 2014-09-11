class AddTypesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :types, :integer
  end
end
