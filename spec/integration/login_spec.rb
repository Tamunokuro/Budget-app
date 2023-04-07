require 'rails_helper'

RSpec.describe 'Login', type: :system do
  before do
    user = User.new(name: 'Jamie', email: 'jamie@gmail.com', password: 'jamiepass',
                    password_confirmation: 'jamiepass')
    user.skip_confirmation!
    user.save!
  end

  scenario 'should be successful' do
    visit new_user_session_path
    fill_in 'Email', with: 'jamie@gmail.com'
    fill_in 'Password', with: 'jamiepass'
    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'should fail' do
    visit new_user_session_path
    fill_in 'Email', with: 'jamie@gmial.com'
    fill_in 'Password', with: 'jamie'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password.')
  end

  scenario 'should see Login' do
    visit root_path
    expect(page).to have_content('LOG IN')
  end
end
