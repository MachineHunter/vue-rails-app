FactoryBot.define do
  factory :command_file do
    filename { 'test.zip' }
    zipdata { File.read("#{Rails.root}/spec/factories/testfiles/test.zip") }
    association :command
  end
end
