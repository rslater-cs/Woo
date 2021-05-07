class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def client
		@client ||= Daily::Client.new
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:forename, :surname, :dob])
	end

end
	#This method is responsible for finding the full name of the user that is currently signed in
	def get_user_logged_in
		if current_user != nil
			return 'Currently signed in as: ' + current_user.forename + ' ' + current_user.surname
		else
			return 'You are not logged in!'
		end
	end
