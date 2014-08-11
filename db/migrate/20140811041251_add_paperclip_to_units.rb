class AddPaperclipToUnits < ActiveRecord::Migration
  def change
    add_attachment :units, :img
  end
end
