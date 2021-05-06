class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments, dependent: :destroy

  validates :forename, :surname, presence: true
  enum role: [:adult, :child, :tutor]

  after_initialize do
  	if self.new_record?
  		self.role ||= :adult
  	end
  end

  def full_name
    "#{forename} #{surname}"
  end
end
