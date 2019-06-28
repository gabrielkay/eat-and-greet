FactoryBot.define do
  factory :event do
    association :creator, factory: :user
    restaurant { 'McDonalds' }
    city { 'Atlanta' }
    start_time { DateTime.now }
  end
end
