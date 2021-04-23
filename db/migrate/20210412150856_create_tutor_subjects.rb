class CreateTutorSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :tutor_subjects do |t|
      t.integer :relID
      t.integer :subjectID
      t.integer :tutorID

      t.timestamps
    end
  end
end
