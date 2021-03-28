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