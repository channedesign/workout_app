require 'rails_helper'

RSpec.describe 'Signing A User Up', type: :feature do
	
	scenario 'with valid credentials' do

		visit '/'
		click_link 'Sign Up'

		expect(page.current_path).to eq(new_user_registration_path)
		fill_in 'First name', with: 'Bob'
		fill_in 'Last name', with: 'Me'
		fill_in 'Email', with: 'bob@me.com'
		fill_in 'Password', with: 'Password'
		fill_in 'Password confirmation', with: 'Password'
		click_button 'Sign up'

		expect(page).to have_content('You have signed up successfully')
		expect(page.current_path).to eq(root_path)
		expect(page).to have_content('Bob Me')

	end

end