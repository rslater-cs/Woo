class RemoveNameFromRoom < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :name
  end
end
