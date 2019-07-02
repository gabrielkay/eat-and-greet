require 'rails_helper'

describe 'Join an Event', type: :feature do
  let!(:event) { create(:event) }
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Joins an existing event' do
    visit('/events')
    click_link('More Info')
    expect do
      click_button('Join Event')
    end.to change{
      Membership.count
    }.by(1)
    expect(page).to have_content('Leave Event')
  end
end

describe 'Leave an Event', type: :feature do
  let!(:user) { create(:user) }
  let!(:membership) { create(:membership, user: user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Leaves an event they were a member of' do
    visit('/events')
    click_link('More Info')
    expect do
      click_link('Leave Event')
    end.to change{
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
    visit('/events')
    click_link('More Info')
    click_button('Join Event')
    visit('/my-events')
    expect(page).to have_content('MyRestaurant')
  end
end
