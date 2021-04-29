# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
	{ email: 'chris@example.com', forename: 'Chris', surname: 'Ellis', role: 'adult', password: 'password', password_confirmation:'password'},
	{ email: 'isayah@example.com', forename: 'Isayah', surname: 'Wedderburn', role: 'tutor', password: 'password', password_confirmation:'password'},
	{ email: 'felipe@example.com', forename: 'Felipe', surname: 'D\'Abrantes', role: 'child', password: 'password', password_confirmation:'password'},
	{ email: 'abel@example.com', forename: 'Abel', surname: 'Csanaki', role: 'adult', password: 'password', password_confirmation:'password'},
	{ email: 'fahad@example.com', forename: 'Fahad', surname: 'Khalaf', role: 'tutor', password: 'password', password_confirmation:'password'},
	{ email: 'ryan@example.com', forename: 'Ryan', surname: 'Slater', role: 'child', password: 'password', password_confirmation:'password'},
	{ email: 'madelaine@example.com', forename: 'Madelaine', surname: 'Donoher-Lambden', role: 'adult', password: 'password', password_confirmation:'password'},
]

users.each do |user|
	this_user = User.where(
		email: user[:email],
	).first_or_initialize

	this_user.update!(
		forename: user[:forename],
		surname: user[:surname],
		role: user[:role],
		password: user[:password],
		password_confirmation: user[:password_confirmation],
	)
	this_user.save
end

# families = [
# 	{ email: 'chris@example.com', forename: 'Chris', surname: 'Ellis', role: 'adult', password: 'password', password_confirmation:'password'},
# 	{ email: 'isayah@example.com', forename: 'Isayah', surname: 'Wedderburn', role: 'tutor', password: 'password', password_confirmation:'password'},
# 	{ email: 'felipe@example.com', forename: 'Felipe', surname: 'D\'Abrantes', role: 'child', password: 'password', password_confirmation:'password'},
# 	{ email: 'abel@example.com', forename: 'Abel', surname: 'Csanaki', role: 'adult', password: 'password', password_confirmation:'password'},
# 	{ email: 'fahad@example.com', forename: 'Fahad', surname: 'Khalaf', role: 'tutor', password: 'password', password_confirmation:'password'},
# 	{ email: 'ryan@example.com', forename: 'Ryan', surname: 'Slater', role: 'child', password: 'password', password_confirmation:'password'},
# 	{ email: 'madelaine@example.com', forename: 'Madelaine', surname: 'Donoher-Lambden', role: 'adult', password: 'password', password_confirmation:'password'},
# ]
#
# families.each do |user|
# 	this_user = User.where(
# 		email: user[:email],
# 		).first_or_initialize
#
# 	this_user.update!(
# 		forename: user[:forename],
# 		surname: user[:surname],
# 		role: user[:role],
# 		password: user[:password],
# 		password_confirmation: user[:password_confirmation],
# 		)
# 	this_user.save
# end

#This part was and can be used for testing tutor_client_relationships, but it is counterproductive to have it seeded when actually using the app
#RELONE = TutorClientRelationship.where(id: 1).first
#RELONE.delete if RELONE

#realtionship1 = TutorClientRelationship.create([id: 1, tutorID:1, clientID:2, relID: 1])

#ACCESSONE = Access.where(id: 1).first
#ACCESSONE.delete if ACCESSONE

#accessone = Access.create([relID: 1, videolink: "www.youtube.com"])


subjects = [
	{ subjectID: 0, name: "computer science"},
	{ subjectID: 1, name: "mathematics"},
	{ subjectID: 2, name: "english"}
]

subjects.each do |subject|
	sub = Subject.where(
		subjectID: subject[:subjectID],
		).first_or_initialize

	sub.update!(
    name: subject[:name]
	)
	sub.save
end

subject_relationships = [
	{ relID: 0, subjectID: 0, tutorID: 2},
	{ relID: 1, subjectID: 1, tutorID: 5},
	{ relID: 2, subjectID: 2, tutorID: 5},
	{ relID: 3, subjectID: 2, tutorID: 2}
]

subject_relationships.each do |subject|
	sub = TutorSubject.where(
		relID: subject[:relID]
	).first_or_initialize

	sub.update!(
		subjectID: subject[:subjectID],
		tutorID: subject[:tutorID]
	)
	sub.save
end
