FactoryBot.define do
  factory :command do
    title { Faker::Book.title }
    description { Faker::Games::HeroesOfTheStorm.quote }
    association :user
    association :genre
    association :command_type

    after(:create) do |command|
      create(:command_file, command: command)
    end
  end
end
