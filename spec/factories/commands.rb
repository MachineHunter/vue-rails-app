FactoryBot.define do
  factory :command do
    title { 'test_command' }
    description { 'this is a test command' }
    association :user
    association :genre
    association :command_type

    after(:create) do |command|
      create(:command_file, command: command)
    end
  end
end
