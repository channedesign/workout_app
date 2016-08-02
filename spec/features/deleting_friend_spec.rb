require 'rails_helper'

RSpec.describe 'Deleting a Friend' do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')

		
		@workout = @bob.workouts.create(duration: 90, workout_details: 'Running 5K', activity_date: Date.today.prev_day)
		@workout2 = @don.workouts.create(duration: 30, workout_details: 'Running 1K', activity_date: Date.today)
		@following = Friendship.create(user_id: @bob.id, friend_id: @don.id)

		login_as @bob
	end

	scenario do

		visit '/'
		click_link 'My Lounge'

		link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
		find(link).click

		expect(page).to have_content(@don.full_name + ' unfollowed')
		expect(page).not_to have_link(@don.full_name)
	end

end