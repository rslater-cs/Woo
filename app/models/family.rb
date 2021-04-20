class Family < ApplicationRecord
	belongs_to :parent, :class_name => 'User', :foreign_key => 'parentID'
	belongs_to :child, :class_name => 'User', :foreign_key => 'childID'
end
