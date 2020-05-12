FactoryBot.define do
  factory :avatar do
    association :user
    filename { 'white.jpeg' }
    filetype { 'image/jpeg' }
    image { File.read("#{Rails.root}/spec/factories/images/white.jpeg") }

    trait :other do
      filename { 'ninja.jpg' }
      filetype { 'image/png' }
      image { File.read("#{Rails.root}/spec/factories/images/ninja.png") }
    end
  end
end
