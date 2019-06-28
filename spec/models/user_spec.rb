require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Associations' do
    subject { build(:user) }

    it { should have_many(:events) }
    it { should have_many(:memberships) }
    it { should have_many(:events_as_member) }
  end

  it { should validate_presence_of(:email)}
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:location)}
end
