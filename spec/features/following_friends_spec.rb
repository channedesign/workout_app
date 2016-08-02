require 'rails_helper'

RSpec.describe 'Following Friends', type: :feature do
	
	before do
		@bob = User.create!(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create!(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')

		login_as @bob
	end

	scenario 'if signed in succeeds' do

		visit '/'

		expect(page).to have_content(@bob.full_name)
		expect(page).to have_content(@don.full_name)
		expect(page).not_to have_link('Follow', href: "/friendships?friend_id=#{@bob.id}")
		link = "a[href='/friendships?friend_id=#{@don.id}']"
		find(link).click
		expect(page).not_to have_link('Follow', href: "/friendships?friend_id=#{@don.id}")
	end

end