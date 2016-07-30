require 'rails_helper'

RSpec.describe 'Searching for User', type: :feature do
	
	before do
		@bob = User.create(first_name: 'Bob', last_name: 'Me', email: 'bob@me.com', password: 'Password')
		@don = User.create(first_name: 'Don', last_name: 'Me', email: 'don@me.com', password: 'Password')
	end

	scenario 'with existing name returns all thos users' do
		visit '/'

		fill_in :search_name, with: 'Bob'
		click_button 'Search'

		expect(page).to have_content(@bob.full_name)
		expect(page).not_to have_content(@don.full_name)
		expect(page.current_path).to eq('/dashboard/search')
	end

end