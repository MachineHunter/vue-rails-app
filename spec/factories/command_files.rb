FactoryBot.define do
  factory :command_file do
    filename { 'MyText' }
    zipdata { '' }
    command_id { 1 }
  end
end
