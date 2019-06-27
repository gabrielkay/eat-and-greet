FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    sequence(:name) { |i| "John#{i} Doe#{i}" }
    location { 'Atlanta' }
    is_private { false }
    password { 'password' }
  end
end
