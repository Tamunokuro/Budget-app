require 'rails_helper'

RSpec.describe 'User Registration', type: :feature do
  scenario 'should fail' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Jamie'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'jamiepass'
    fill_in 'Password confirmation', with: 'jamiepass'
    click_button 'Sign up'
    expect(page).to have_content('Email can\'t be blank')
  end

  scenario 'should fail' do
    visit new_user_registration_path
    fill_in 'Name', with: ''
    fill_in 'Email', with: 'jamie@gmail.com'
    click_button 'Sign up'
    expect(page).to have_content('Name can\'t be blank')
  end
end
