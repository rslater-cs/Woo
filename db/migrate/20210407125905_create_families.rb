class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.integer :parentID
      t.integer :childID

      t.timestamps
    end
  end
end
