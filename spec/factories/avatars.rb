FactoryBot.define do
  factory :avatar do
    association :user
    filename { 'white.jpeg' }
    filetype { 'image/jpeg' }
    image { File.read("#{Rails.root}/spec/factories/images/white.jpeg") }
    filesize { image.size }

    trait :other do
      filename { 'white2.png' }
      filetype { 'image/png' }
      image { File.read("#{Rails.root}/spec/factories/images/white2.png") }
    end
  end
end
