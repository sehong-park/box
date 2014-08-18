class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      
      # this line adds an integer column called 'user_id'
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
