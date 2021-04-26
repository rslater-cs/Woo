class CreateTutorClientRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :tutor_client_relationships do |t|
      t.integer :tutorID
      t.integer :clientID
      t.integer :subjectID
      t.integer :relID, foreign_key: true

      t.timestamps
    end
  end
end
