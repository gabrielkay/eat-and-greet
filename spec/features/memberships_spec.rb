require 'rails_helper'

describe 'Join an Event', type: :feature do
  let!(:event) { create(:event) }
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Joins an existing event' do
    visit(event_path(event))
    expect {
      click_button('Join Table')
    }.to change{
      Membership.count
    }.by(1)
    expect(page).to have_content('Leave Table')
  end
end

describe 'Leave an Event', type: :feature do
  let!(:user) { create(:user) }
  let!(:membership) { create(:membership, user: user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Leaves an event they were a member of' do
    visit(event_path(membership.event_id))
    expect {
      click_link('Leave Table')
    }.to change{
      Membership.count
    }.by(-1)
    expect(page).to_not have_content('Leave Event')
  end
end

describe 'My Events Page', type: :feature do
  let!(:event) { create(:event, restaurant: 'MyRestaurant') }
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Joins an event and navigates to My Events' do
    visit(event_path(event))
    click_button('Join Table')
    visit('/my-tables')
    expect(page).to have_content('MyRestaurant')
  end
end
