class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tutor_client_relationship
  validates :body, presence: true, allow_blank: false
end
