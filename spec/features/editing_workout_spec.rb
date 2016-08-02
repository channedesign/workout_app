require 'rails_helper'

RSpec.describe 'Editing Workouts', type: :feature do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@workout = @bob.workouts.create!(duration: 90, workout_details: 'Running 5K', activity_date: Date.today)
		login_as @bob
		visit '/'
		click_link 'My Lounge'

		expect(page.current_path).to eq(user_workouts_path(@bob))
		link = "a[href='/users/#{@bob.id}/workouts/#{@workout.id}/edit']"
		find(link).click

		expect(page.current_path).to eq(edit_user_workout_path(@bob, @workout))
	end

	scenario 'with valid inputs' do
		fill_in 'Duration', with: 50
		click_button 'Update Workout'

		expect(page).to  have_content('Workout has been updated')
		expect(page).to  have_content(50)
		expect(page).not_to  have_content(90)
		expect(page.current_path).to eq(user_workouts_path(@bob))
	end

	scenario 'with invalid inputs' do
		fill_in 'Duration', with: nil
		click_button 'Update Workout'

		expect(page).to  have_content('Workout has not been updated')
	end

end