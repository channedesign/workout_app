require 'rails_helper'

RSpec.describe 'Listing Workouts', type: :feature do
	
	before do
		@bob = User.create(email: 'bob@me.com', password: 'Password')
		login_as @bob
		@workout = @bob.workouts.create(duration: 90, workout_details: 'Running 5K', activity_date: '2016-8-17')
		@workout2 = @bob.workouts.create(duration: 30, workout_details: 'Running 1K', activity_date: '2016-8-18')
	end

	scenario "Shows user's workouts for the last 7 days" do 
		visit '/'
		click_link 'My Lounge'

		expect(page.current_path).to eq(user_workouts_path(@bob))
		expect(page).to have_content(@workout.duration)
		expect(page).to have_content(@workout.workout_details)
		expect(page).to have_content(@workout.activity_date)
		expect(page).to have_content(@workout2.duration)
		expect(page).to have_content(@workout2.workout_details)
		expect(page).to have_content(@workout2.activity_date)
	end

end