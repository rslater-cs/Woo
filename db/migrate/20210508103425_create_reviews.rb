class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :tutorID
      t.integer :userID
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
