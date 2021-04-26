class Family < ApplicationRecord
	belongs_to :parent, :class_name => 'User', :foreign_key => 'parentID', optional: true
	belongs_to :child, :class_name => 'User', :foreign_key => 'childID', optional: true
end
