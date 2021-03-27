class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :address, null: true, foreign_key: true
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :phone, :string
    add_column :users, :birthday, :date
    add_column :users, :bio, :text
  end
end
