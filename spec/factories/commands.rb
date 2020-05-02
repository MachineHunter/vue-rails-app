FactoryBot.define do
  factory :command do
    title { 'test_command' }
    description { 'this is a test command' }
    association :user
    association :genre
    association :command_type
  end
end
