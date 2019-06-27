FactoryBot.define do
  factory :event do
    restaurant { 'McDonalds' }
    city { 'Atlanta' }
    start_time { DateTime.now }
  end
end
