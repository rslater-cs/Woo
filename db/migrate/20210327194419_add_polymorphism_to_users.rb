class AddPolymorphismToUsers < ActiveRecord::Migration[6.1]
  def change
  	add_reference :users, :role, polymorphic: true
  end
end
