FactoryBot.define do
  factory :movie do
    movie_title {Faker::Lorem.sentence}
    image_url {Faker::Lorem.sentence}
    thought {Faker::Lorem.sentence}
    genre_id { Faker::Number.between(from: 1, to: 10) }
    evaluation { Faker::Number.between(from: 1, to: 5) }
    release {"公開"}
    association :user

    after(:build) do |movie|
      movie.image.attach(io: File.open('public/images/test_image.gif'), filename: 'test_image.gif')
    end
  end
end
