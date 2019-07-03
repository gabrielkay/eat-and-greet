require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Associations' do
    subject { build(:comment) }

    it { should belong_to(:user) }
    it { should belong_to(:event) }
  end

  context 'empty comment' do
    let(:comment) { build(:comment, body: nil) }

    it { should validate_presence_of(:body) }
  end
end
