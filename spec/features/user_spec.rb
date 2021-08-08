require 'rails_helper'

RSpec.describe 'User', type: :feature do
  scenario 'Sign up with correct attr', js: true do
    visit root_path
    click_link_or_button 'Sign up'
    expect(page).to have_content 'Password (6 characters minimum)'
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Bio', with: 'I am testing bot'
      fill_in 'Name', with: 'Boto Botich'
      fill_in 'Password', with: 'password1'
      fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'
    expect(page).to have_content 'Posts of'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_link_or_button 'Preferences'
    click_link_or_button 'Log out'
    expect(page).to have_content 'Some of our users'
  end


end