FactoryBot.define do
  factory :comment do
    user
    event
    body { "Sample Comment "}
  end
end
