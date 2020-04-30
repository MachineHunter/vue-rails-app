FactoryBot.define do
  factory :avatar do
    association :user
    filename { 'white.jpeg' }
    filetype { 'image/jpeg' }
    image { File.read("#{Rails.root}/spec/factories/images/white.jpeg") }
  end
end
