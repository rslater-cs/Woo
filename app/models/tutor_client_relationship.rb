class TutorClientRelationship < ApplicationRecord

    has_many_attached :files, dependent: :destroy
    
end
