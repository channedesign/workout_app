require 'rails_helper'

RSpec.describe 'Listing Workouts', type: :feature do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')

		login_as @bob
		@workout = @bob.workouts.create(duration: 90, workout_details: 'Running 5K', activity_date: Date.today.prev_day)
		@workout2 = @bob.workouts.create(duration: 30, workout_details: 'Running 1K', activity_date: Date.today)
		@following = Friendship.create(user_id: @bob.id, friend_id: @don.id)

		visit '/'
		click_link 'My Lounge'
	end

	scenario "Shows user's workouts for the last 7 days" do 
		expect(page.current_path).to eq(user_workouts_path(@bob))
		expect(page).to have_content(@workout.duration)
		expect(page).to have_content(@workout.workout_details)
		expect(page).to have_content(@workout.activity_date)
		expect(page).to have_content(@workout2.duration)
		expect(page).to have_content(@workout2.workout_details)
		expect(page).to have_content(@workout2.activity_date)
	end

	scenario 'shows a list of users friends' do

		expect(page).to have_content('My Friends')
		expect(page).to have_content(@don.full_name)
		expect(page).to have_link('Unfollow')

	end

end