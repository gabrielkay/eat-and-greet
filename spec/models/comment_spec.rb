require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    subject { build(:comment) }

    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  it { should validate_presence_of(:body) }
end
