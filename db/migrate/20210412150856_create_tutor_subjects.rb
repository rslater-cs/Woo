class CreateTutorSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :tutor_subjects do |t|
      t.integer :subjectID
      t.integer :tutorID
      t.string :subject

      t.timestamps
    end
  end
end
