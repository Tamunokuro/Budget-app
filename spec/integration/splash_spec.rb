require 'rails_helper'

RSpec.describe 'Splash screen', type: :feature do
  scenario 'should see Login' do
    visit root_path
    expect(page).to have_content('LOG IN')
  end

  scenario 'should see Sign up' do
    visit root_path
    expect(page).to have_content('SIGN UP')
  end

  scenario 'should see About' do
    visit root_path
    expect(page).to have_content('BUDGETLY')
  end
end
