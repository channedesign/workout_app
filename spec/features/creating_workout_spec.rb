require 'rails_helper'

RSpec.describe 'Creating A Workout', type: :feature do
		
	before do
		@bob = User.create(email: 'bob@me.com', password: 'Password')
		login_as @bob

		visit '/'
		click_link 'My Lounge'

		expect(page.current_path).to eq(user_workouts_path(@bob))
		click_link 'New Workout'

		expect(page.current_path).to eq(new_user_workout_path(@bob))
		expect(page).to have_link('Back')
	end

	scenario 'with valid inputs' do
		
		fill_in "Duration", with: 90
		fill_in 'Workout details', with: 'Weight lifting'
		fill_in 'Activity date', with: Date.today
		click_button 'Create Workout'

		expect(page).to have_content('Workout has been created')
		expect(page.current_path).to eq(user_workout_path(@bob, Workout.last))
	end

	scenario 'with invalid inputs' do

		fill_in "Duration", with: 'hi'
		fill_in 'Workout details', with: ''
		fill_in 'Activity date', with: ''
		click_button 'Create Workout'

		expect(page).to have_content('has to be a number')
		expect(page).to have_content("can't be blank")
		expect(page).to have_content('Workout has not been created')
	end



end