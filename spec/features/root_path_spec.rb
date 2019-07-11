describe 'Root for logged in user', type: :feature do
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  it 'Visits root' do
    visit('/')
    expect(page).to have_current_path('/')
  end
end

describe 'Root for new visitor', type: :feature do

  it 'Visits root' do
    visit('/')
    expect(page).to have_current_path('/users/sign_in')
  end
end
