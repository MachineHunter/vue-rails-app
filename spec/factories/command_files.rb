FactoryBot.define do
  factory :command_file do
    filename { 'samplefile' }
    zipdata { File.read("#{Rails.root}/spec/factories/testfiles/test.zip") }
    association :command
  end
end
