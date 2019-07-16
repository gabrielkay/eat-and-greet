require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Associations' do
    subject { build(:event) }

    it { should belong_to(:creator) }
    it { should have_many(:memberships) }
    it { should have_many(:members) }
  end

  describe 'Building Events' do
    let!(:user) { create(:user) }
    it "should build event and membership to that event together" do
      today = DateTime.now.beginning_of_day
      event = Event.build_with_member(user,
        {restaurant: "restaurant1", restaurant_address: "address1", title: "title1",
          min_people: 3, max_people: 4, diet: "diet1", start_time: today, end_time: today})
      expect(event.restaurant).to eq "restaurant1"
      expect(event.creator_id).to eq user.id
      expect(event.save).to eq true
      expect(Membership.exists?(event_id: event.id, user_id: user.id)).to eq true
    end
  end

  it { should validate_presence_of(:restaurant)}
  it { should validate_presence_of(:city)}
  it { should validate_presence_of(:start_time)}
  it { should validate_presence_of(:creator_id)}
end
