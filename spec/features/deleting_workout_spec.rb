require 'rails_helper'

RSpec.describe 'Deleting Workout', type: :feature do
	
	before do 
		@bob = User.create(email: 'bob@me.com', password: 'Password')
		@workout = @bob.workouts.create(duration: 90, workout_details: 'Running 5K', activity_date: Date.today)
		login_as @bob
	end

	scenario do
		visit '/'
		click_link 'My Lounge'

		expect(page.current_path).to eq(user_workouts_path(@bob))
		expect(page).to have_content(90)
		expect(page).to have_content('Running 5K')
		expect(page).to have_content(Date.today)
		link = "//a[contains(@href, '/users/#{@bob.id}/workouts/#{@workout.id}') and .//text()='Delete']"
		find(:xpath, link).click

		expect(page).to have_content('Workout deleted successfully')
		expect(page).not_to have_content(90)
		expect(page).not_to have_content('Running 5K')
		expect(page).not_to have_content(Date.today)
	end

end