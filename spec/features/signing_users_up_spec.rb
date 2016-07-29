require 'rails_helper'

RSpec.describe 'Signing A User Up', type: :feature do
	
	before do
		visit '/'
		click_link 'Sign Up'

		expect(page.current_path).to eq(new_user_registration_path)
	end

	scenario 'with valid credentials' do

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

	scenario 'with invalid credentials' do

		fill_in 'First name', with: ''
		fill_in 'Last name', with: ''
		fill_in 'Email', with: ''
		fill_in 'Password', with: ''
		fill_in 'Password confirmation', with: ''
		click_button 'Sign up'

		expect(page).to have_content("First name can't be blank")
		expect(page).to have_content("Last name can't be blank")

	end

end