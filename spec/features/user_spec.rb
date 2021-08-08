require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let(:user) { build(:user) }
  let(:comment) { build(:comment) }
  let!(:post) { build(:post) }
  scenario 'Sign up, sign out and sign in with correct attr. User are making a post and a comment', js: true do
    visit root_path
    click_link_or_button 'Sign up'
    expect(page).to have_content 'Password (6 characters minimum)'
    fill_in 'Email', with: user.email
    fill_in 'Bio', with: user.bio
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content 'Posts of'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    click_link_or_button 'Preferences'
    click_link_or_button 'Log out'
    expect(page).to have_content 'Some of our users'
    click_link_or_button 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content 'Posts of'
    click_link_or_button 'New Post'
    fill_in 'Description', with: post.description
    page.attach_file 'spec/fixtures/files/Jove_decadent.jpg'
    click_button 'Create Post'
    expect(page).to have_content 'Post was successfully created'
    expect(page).to have_content post.description
    fill_in 'Commentary', with: comment.commentary
    click_button 'Create Comment'
    expect(page).to have_content 'The comment was created successfully'
    expect(page).to have_content post.description
    expect(page).to have_content comment.commentary
  end
end
