class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :forename, :surname, presence: true
  enum role: [:adult, :child, :tutor]

  has_many :parents, :class_name => 'Family', :foreign_key => 'parentID'
  has_many :children, :class_name => 'Family', :foreign_key => 'childID'

  after_initialize do
  	if self.new_record?
  		self.role ||= :adult
  	end
  end

  def full_name
    "#{forename} #{surname}"
  end
end
