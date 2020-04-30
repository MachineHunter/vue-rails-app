FactoryBot.define do
  factory :command do
    title { 'MyText' }
    description { 'MyText' }
    user_id { 1 }
    genre_id { 1 }
    command_type_id { 1 }
  end
end
