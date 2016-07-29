require 'rails_helper'

RSpec.describe 'Listing Members', type: :feature do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create(first_name: 'Don', last_name: 'Juan', email: 'don@me.com', password: 'Password')
	end

	scenario 'shows a list of registerd members' do
		visit '/'

		expect(page).to have_content('List of Members')
		expect(page).to have_content(@bob.full_name)
		expect(page).to have_content(@don.full_name)
	end

end