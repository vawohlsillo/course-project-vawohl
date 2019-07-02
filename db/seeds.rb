# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
super_admin = User.create( name: "Vicente Wohl", biography: "SuperAdmin at Filch App in Santiago,Chile Geofence", sex: "Man", role: "SuperAdmin", email: "vawohl@miuandes.cl", password: "password123")
admin = User.create( name: "Jebus", biography: "Admin at Filch App in Santiago,Chile geofence. Son of god. Mentioned in The Simpsons", sex: "Man" , role: "Admin", email: "jebus@fake.com", password: "password123")
user1 = User.create( name: "Esteban Dido", biography: "Studying civil engineering in University of Los Andes in Santiago", sex: "Man", email: "edido@miuandes.cl", password: "password123")
@users = [super_admin, admin, user1]

#for u in @users do
#	u.save!
#end

inappropiate_p1 = InappropiatePost.create()
#inappropiate_p1.save!
post1 = Post.create(user: @users[1], title: 'Transportation in San Carlos it is very bad', description: 'When I came back to home from university, it is a hole mess because transantiago buses are full from its capacity so it takes one hour to get tu Los Dominicos Subway', like: 3, unlike: 1,  solve_status: 0, inappropiate_counter: 0, inappropiate_post: inappropiate_p1)

@posts = [ post1 ]

#for po in @posts do 
#	po.save!
#end

inappropiate_c1 = InappropiateComment.create()
#inappropiate_c1.save!
comment1 = Comment.create(post: @posts[0], user: @users[0], description: 'I am agree with you my friend. The system is not efficent', inappropiate_counter: 0, inappropiate_comment: inappropiate_c1)
 
@comments = [ comment1 ]

#for c in @comments do 
#	c.save!
#end


