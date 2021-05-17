class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]

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
		puts '*******'
		puts params
		puts update_user_params
		respond_to do |format|
			if current_user.update(update_user_params)
				format.html { redirect_to current_user, notice: 'You successfully updated your profile' }
			else
				format.html { render :edit }
			end
		end
	end

	def legal
	end

	def become_tutor
		@user = current_user
		@user.role = 'tutor'
		if @user.save
			redirect_to user_path(@user), notice: "User successfully updated"
		else
			redirect_to user_path(@user), alert: "Failed to update user"
		end
	end

	def create
		@user = User.new(new_user_params)
		@user.role = 'child'
		if @user.save
			Family.new(parentID: current_user.id, childID: @user.id).save
			redirect_to user_path(@user), notice: "User successfully created"
		else
			render :new
		end
	end

	#helper method to display tutor's subjects on their profile pages
	def subj
		@tutor_subjects = TutorSubject.where(tutorID: @user.id).select(:subjectID)
		@tutor_subjects = Subject.where(subjectID: @tutor_subjects)
		subs = []
		@tutor_subjects.each do |tutor_subject|
			subs.append([tutor_subject.name.capitalize!, tutor_subject.subjectID])
		end
	return subs
	end

	def book_tutor
		tutorID = params[:tutorID]
		clientID = params[:clientID]
		subjectID = params[:subjectID]

		maxkey = TutorClientRelationship.maximum("relID")
		if maxkey.nil?
			maxkey = 0
		end
		maxkey = maxkey + 1

		relationship = TutorClientRelationship.new(tutorID: tutorID, clientID: clientID, subjectID: subjectID, relID: maxkey)

		conflicts = TutorClientRelationship.where(subjectID: subjectID, clientID: clientID)

		if conflicts.length > 0
			redirect_to user_path(tutorID), alert: "Booking failed: You're already booked to this subject"
			return
		end

		if relationship.valid?
			relationship.save!
			access = Access.new(relID: maxkey)
			access.save!
			redirect_to tutor_client_relationships_path, notice: 'Booking saved successfully'
		else
			redirect_to user_path(tutorID), alert: 'Booking failed: Invalid arguments'
		end
	end

	def get_reviews
		reviews = Review.where(tutorID: @user.id)
		review_arr = []

		reviews.each do |review|
			content = []
			user = User.where(id: review.userID).first
			username = "Anon"
			unless user.nil?
				username = user.forename
			end
			content.append(username)
			content.append(review.rating)
			content.append(review.content)
			review_arr.append(content)
		end

		return review_arr
	end

	def add_subject
		sub_name = params[:subject_name]
		if sub_name.empty?
			redirect_to user_path(current_user.id), alert: "Text field must be filled"
			return
		end
		matches = Subject.where(name: sub_name)

		maxkey = TutorSubject.maximum("relID")
		relkey = maxkey+1
		subkey = 0
		if matches.length > 0
			subkey = matches[0].subjectID
		else
			maxsubkey = Subject.maximum("subjectID")
			new_sub = Subject.new(subjectID: maxsubkey+1, name: sub_name)
			subkey = maxsubkey+1
			unless new_sub.save
				redirect_to user_path(current_user.id), notice: "New subject could not be made"
				return
			end
		end

		new_ts = TutorSubject.new(relID: relkey, tutorID: current_user.id, subjectID: subkey)
		if new_ts.save
			redirect_to user_path(current_user.id), notice: "New subject created"
		else
			redirect_to user_path(current_user.id), alert: "Subject relationship failed to save"
		end
	end

	helper_method :subj, :get_reviews

	private

	def user_params
		params.require(:user).permit(
			:forename,
			:surname,
			:phone,
			:dob
		)

		params.except(:booking).permit(
		:tutorID,
		:clientID,
		:subjectID
		)

		params.except(:sub).permit(
			:subject_name
		)
	end

	def new_user_params
		params.require(:user).permit(
			:forename,
			:surname,
			:email,
			:dob,
			:password,
			:password_confirmation,
		)
	end


	def update_user_params
		params.require(:user).permit(
			:forename,
			:surname,
			:phone,
			:dob,
			:bio
		)
	end

end
