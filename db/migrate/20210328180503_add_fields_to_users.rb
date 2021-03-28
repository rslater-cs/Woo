class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :forename, :string
    add_column :users, :surname, :string
    add_column :users, :role, :integer
    add_column :users, :phone, :string
    add_column :users, :dob, :date
  end
end
