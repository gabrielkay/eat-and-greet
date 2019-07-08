require 'rails_helper'

describe 'Create an Event', type: :feature do
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Fills in event details' do
    visit('/events/new')
    fill_in 'event_restaurant', with: 'Burger King'
    fill_in 'event_start_time', with: DateTime.now
    expect {
      click_button 'Create Event'
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
    visit('/events')
    click_link('More Info')
    click_link('Edit Event')
    fill_in 'event_restaurant', with: 'ChangedRestaurant'
    click_button 'Save Changes'
    expect(page).to have_content('ChangedRestaurant')
  end
end

describe 'Delete an Event', type: :feature do
  let!(:user) { create(:user) }
  let!(:event) { create(:event, restaurant: 'WillBeDeleted', creator_id: user.id) }

  before do
    login_as(user, scope: :user)
  end

  it 'Deletes an existing event' do
    visit('/events')
    click_link('More Info')
    expect {
      click_link('Delete Event')
    }.to change {
      Event.count
    }.by(-1)
    expect(page).to_not have_content('WillBeDeleted')
  end
end