require 'rails_helper'

RSpec.describe 'Signing a User Out', type: :feature do

	scenario do
		bob = User.create(email: 'bob@me.com', password: 'Password')

		login_as bob

		visit '/'
		click_link 'Sign Out'

		expect(page).to have_content('Signed out successfully')
	end

end