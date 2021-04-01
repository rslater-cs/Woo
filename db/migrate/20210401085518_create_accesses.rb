class CreateAccesses < ActiveRecord::Migration[6.1]
  def change
    create_table :accesses do |t|
      t.integer :relID, foreign_key: true
      t.string :videolink

      t.timestamps
    end
  end
end
