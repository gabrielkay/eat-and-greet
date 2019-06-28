require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'Associations' do
    subject { build(:membership) }

    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end

  it { should validate_presence_of(:user_id)}
  it { should validate_presence_of(:event_id)}
end
