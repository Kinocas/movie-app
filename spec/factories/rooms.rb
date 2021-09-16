FactoryBot.define do
  factory :room do
    room_name {Faker::Lorem.sentence}
    purpose {Faker::Lorem.sentence}
    association :user
  end
end
