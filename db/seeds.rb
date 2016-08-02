# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
channe = User.create!(first_name: 'Channe', last_name: 'Bertrand', email: 'channebertrand@gmail.com', password: 'Password1234')
bob = User.create!(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
don = User.create!(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')
User.create!(first_name: 'James', last_name: 'Parker', email: 'james@me.com', password: 'Password')
User.create!(first_name: 'Ricardo', last_name: 'Diaz', email: 'ricardo@me.com', password: 'Password')
User.create!(first_name: 'Albert', last_name: 'Rete', email: 'alb@me.com', password: 'Password')
User.create!(first_name: 'Meg', last_name: 'Openo', email: 'meg@me.com', password: 'Password')
User.create!(first_name: 'Bob', last_name: 'Marley', email: 'bobm@me.com', password: 'Password')
User.create!(first_name: 'Camille', last_name: 'Bertrand', email: 'kmi@me.com', password: 'Password')
User.create!(first_name: 'Julia', last_name: 'Pelle', email: 'juju@me.com', password: 'Password')
User.create!(first_name: 'Leon', last_name: 'Neo', email: 'ln@me.com', password: 'Password')
User.create!(first_name: 'Nami', last_name: 'Mugi', email: 'nami@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Ped', email: 'pierre@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Petit', email: 'pierre1@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Grand', email: 'pierre2@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Me', email: 'pierre3@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Pasla', email: 'pierre4@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Paslash', email: 'pierre5@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Tifu', email: 'pierre7@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Pier', email: 'pierre6@me.com', password: 'Password')
User.create!(first_name: 'Pierre', last_name: 'Loki', email: 'pierre8@me.com', password: 'Password')


channe_workout1 = channe.workouts.create!(duration: 90, workout_details: 'Running 5K', activity_date: Date.today.prev_day)
channe_workout2 = channe.workouts.create!(duration: 200, workout_details: 'Running 10K', activity_date: Date.today)

bob_workout1 = bob.workouts.create!(duration: 20, workout_details: 'Push ups', activity_date: Date.today.prev_day)
bob_workout2 = bob.workouts.create!(duration: 100, workout_details: 'Climbing', activity_date: Date.today)

don_workout1 = don.workouts.create!(duration: 30, workout_details: 'Running', activity_date: Date.today.prev_day)
don_workout2 = don.workouts.create!(duration: 50, workout_details: 'Dancing', activity_date: Date.today)