class TutorClientRelationship < ApplicationRecord

    has_many_attached :files, dependent: :destroy
    has_many :comments, dependent: :destroy
end
