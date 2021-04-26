class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]


	def index
		@users = User.all
		@tutor_subjects = TutorSubject.all
	end

	def show
	  	@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = current_user
	end

	def update
		respond_to do |format|
			if current_user.update(user_params)
				format.html { redirect_to current_user, notice: 'You successfully updated your profile' }
			else
				format.html { render :edit }
			end
		end
	end

	def create
		@user = User.new(new_user_params)
		@user.role = 'child'
		if @user.save
			redirect_to users_url, notice: "User successfully created"
		else
			render :new
		end
	end

	#helper method to display tutor's subjects on their profile pages
	def subj
		@tutor_subjects = TutorSubject.all
		subjStr = String.new("")
		@tutor_subjects.each do |tutor_subject|
			if tutor_subject.tutorID == @user.id
				subjStr = subjStr + tutor_subject.subject.capitalize! + " "
			end
		end
	return subjStr
	end
	helper_method :subj

	private

	def user_params
		params.require(:user).permit(
			:forename,
			:surname,
			:phone,
			:dob,
		)
	end

	def new_user_params
		params.require(:user).permit(
			:forename,
			:surname,
			:email,
			:password,
			:password_confirmation,
		)
	end

end
