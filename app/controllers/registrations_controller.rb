class RegistrationsController < Devise::RegistrationsController
	def create
		super do
			resource.role = 'tutor'
			#@family = Family.create
			#@family.parentID = resource.id
			#@family.save
		end
	end
end