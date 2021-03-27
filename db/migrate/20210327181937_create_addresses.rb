class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :town
      t.string :county
      t.string :country
      t.string :postcode

      t.timestamps
    end
  end
end
