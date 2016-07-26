require 'rails_helper'

RSpec.describe 'Signing a User In', type: :feature do
		
	before do
		@bob = User.create(email: 'bob@me.com', password: 'Password')
	end

	scenario 'with valid credentials' do

		visit '/'
		click_link 'Sign In'

		expect(page.current_path).to eq(new_user_session_path)
		fill_in 'Email', with: @bob.email
		fill_in 'Password', with: @bob.password
		click_button 'Sign in'

		expect(page.current_path).to eq(root_path)
		expect(page).to have_content('Signed in successfully')
		expect(page).to have_content("Signed in as #{@bob.email}")
		expect(page).not_to have_link('Sign In')
		expect(page).to have_link('Sign Out')
	end

end