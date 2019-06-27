require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should validate_presence_of(:restaurant)}
  it { should validate_presence_of(:city)}
  it { should validate_presence_of(:start_time)}
end
