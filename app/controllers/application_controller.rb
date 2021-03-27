class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
    case current_user.role_type
    when "Adult"
        return adult_index_path
    when "Tutor"
        return adult_index_path
    when "Child"
        return adult_index_path
    end
end

end
