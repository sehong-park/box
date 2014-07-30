class RemoveAnyQuestionFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :any_question
  end
end
