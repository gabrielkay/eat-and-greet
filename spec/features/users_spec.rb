require 'rails_helper'

describe 'Create an account', type: :feature do
  it 'Creates account' do
    visit('/users/sign_up')
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'example@default.com'
    select 'Denver-Boulder, CO', from: 'user_location'
    fill_in 'user_password', with: 'password1'
    fill_in 'user_password_confirmation', with: 'password1'
    expect {
      click_button('Create my account')
    }.to change {
      User.count
    }.by(1)
    expect(page).to have_content('Your account has been created')
  end
end

describe 'Create an account with invalid password', type: :feature do
  it 'Fails to create account' do
    visit('/users/sign_up')
    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'example@default.com'
    select 'Denver-Boulder, CO', from: 'user_location'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_button('Create my account')
    expect(page).to_not have_content('Your account has been created')
    expect(page).to have_content('Password must be 8-50 characters and include at least 1 letter and 1 number')
  end
end

describe 'Log into an account', type: :feature do
  let!(:user) { create(:user, email: 'login@example.com') }

  it 'Logs in' do
    visit('/users/sign_in')
    fill_in 'user_email', with: 'login@example.com'
    fill_in 'user_password', with: 'password1'
    click_button('Log in')
    expect(page).to have_content('Browse Tables')
  end
end

describe 'Displays a User profile page', type: :feature do
  let!(:user) { create(:user, name: 'FirstName LastName') }

  before do
    login_as(user, scope: :user)
  end

  it 'Logs in' do
    visit("/users/#{user.slug}")
    expect(page).to have_content('FirstName LastName')
  end
end
