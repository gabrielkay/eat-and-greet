require 'rails_helper'

describe 'Create an Event', type: :feature do
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Fills in event details' do
    visit('/tables/new')
    fill_in 'event_restaurant', with: 'Burger King'
    fill_in 'event_date_field', with: "11/11/2019"
    fill_in 'event_start_time_field', with: Time.now
    fill_in 'event_end_time_field', with: Time.now
    select "Denver-Boulder, CO", from: "event_city"
    select 4, from: "event_max_people"
    expect {
      click_button 'Create Table'
    }.to change {
      Event.count
    }.by(1)
    expect(page).to have_content('Burger King')
  end
end

describe 'Edit an Event', type: :feature do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, creator_id: user.id) }

  before do
    login_as(user, scope: :user)
  end

  it 'Edits an existing event' do
    visit(edit_event_path(event))
    fill_in 'event_title', with: 'ChangedTitle'
    fill_in 'event_date_field', with: "11/11/3000"
    fill_in 'event_start_time_field', with: Time.now
    fill_in 'event_end_time_field', with: Time.now
    select "Denver-Boulder, CO", from: "event_city"
    select 4, from: "event_max_people"
    click_button 'Save Changes'
    expect(page).to have_content('ChangedTitle')
  end
end

describe 'Delete an Event', type: :feature do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, restaurant: 'WillBeDeleted', creator_id: user.id) }

  before do
    login_as(user, scope: :user)
  end

  it 'Deletes an existing event' do
    visit(event_path(event))
    expect {
      click_button('Cancel Table')
    }.to change {
      Event.count
    }.by(-1)
    expect(page).to_not have_content('WillBeDeleted')
  end
end
