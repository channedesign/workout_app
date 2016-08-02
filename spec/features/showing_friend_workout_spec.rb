require 'rails_helper'

RSpec.describe 'Showing Friend Workout', type: :feature do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')

		
		@workout = @bob.workouts.create(duration: 90, workout_details: 'Running 5K', activity_date: Date.today.prev_day)
		@workout2 = @don.workouts.create(duration: 30, workout_details: 'Running 1K', activity_date: Date.today)
		@following = Friendship.create(user_id: @bob.id, friend_id: @don.id)

		login_as @bob
	end

	scenario "show friend's workout for the last 7 days" do
		visit '/'
		click_link 'My Lounge'

		expect(page.current_path).to eq(user_workouts_path(@bob))
		click_link @don.full_name

		expect(page).to have_content(@don.full_name + "'s Workouts")
		expect(page).to have_content(@workout2.workout_details)
		expect(page).to have_css('div#workout-chart')

	end

end