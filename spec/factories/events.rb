FactoryBot.define do
  factory :event do
    association :creator, factory: :user
    restaurant { 'McDonalds' }
    restaurant_address { 'McDonalds' }
    title { 'EventTitle' }
    city { 'Atlanta' }
    start_time { DateTime.now }
    end_time { DateTime.now }
    min_people { 3 }
    max_people { 4 }
  end
end
