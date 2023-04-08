require 'rails_helper'

RSpec.describe 'Group', type: :system do
  before do
    user = User.new(name: 'Jamie', email: 'jamie@gmail.com', password: 'jamiepass',
                    password_confirmation: 'jamiepass')
    user.save!
  end

  scenario 'should see add category button' do
    visit new_user_session_path
    fill_in 'Email', with: 'jamie@gmail.com'
    fill_in 'Password', with: 'jamiepass'
    click_button 'Log in'
    expect(page).to have_content('ADD CATEGORY')
  end

  scenario 'Add Group' do
    visit new_user_session_path
    fill_in 'Email', with: 'jamie@gmail.com'
    fill_in 'Password', with: 'jamiepass'
    click_button 'Log in'
    click_link 'ADD CATEGORY'
    fill_in 'Name', with: 'Group 1'
    fill_in 'Icon', with: 'group.png'
    find(:xpath, '/html/body/div[2]/form/div[3]').click
  end

  scenario 'View Group created' do
    visit new_user_session_path
    fill_in 'Email', with: 'jamie@gmail.com'
    fill_in 'Password', with: 'jamiepass'
    click_button 'Log in'
    expect(page).to have_content('TRANSACTIONS')
  end
end
