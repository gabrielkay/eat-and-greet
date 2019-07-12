require 'rails_helper'

describe 'Create an account', type: :feature do
  it 'Creates account' do
    visit('/users/sign_up')
    fill_in 'Email', with: 'example@default.com'
    fill_in 'Name', with: 'John Doe'
    fill_in 'Password', with: 'password'
    fill_in 'Location', with: 'Durham'
    fill_in 'Password confirmation', with: 'password'
    expect {
      click_button('Sign up')
    }.to change {
      User.count
    }.by(1)
    expect(page).to have_content('You have signed up successfully')
  end
end

describe 'Log into an account', type: :feature do
  let!(:user) { create(:user, email: 'login@example.com') }

  it 'Logs in' do
    visit('/users/sign_in')
    fill_in 'user_email', with: 'login@example.com'
    fill_in 'user_password', with: 'password'
    click_button('Sign in')
    expect(page).to have_content('Signed in successfully.')
  end
end

describe 'Displays a User profile page', type: :feature do
  let!(:user) { create(:user, name: 'FirstName LastName') }

  before do
    login_as(user, scope: :user)
  end

  it 'Logs in' do
    visit("/users/#{user.id}")
    expect(page).to have_content('FirstName LastName')
  end
end
