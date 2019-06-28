require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    subject { build(:event) }

    it { should belong_to(:creator) }
    it { should have_many(:memberships) }
    it { should have_many(:members) }
  end

  it { should validate_presence_of(:restaurant)}
  it { should validate_presence_of(:city)}
  it { should validate_presence_of(:start_time)}
  it { should validate_presence_of(:creator_id)}
end
