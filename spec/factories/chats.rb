FactoryBot.define do
  factory :chat do
    chat {Faker::Lorem.sentence}
    association :room
    association :user
  end
end
