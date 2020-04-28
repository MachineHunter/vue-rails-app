FactoryBot.define do
  factory :avatar do
    filename { 'eagle.jpg' }
    filetype { 'image/jpeg' }
    image { File.open("#{Rails.root}/spec/factories/images/eagle.jpg") }
    association :user
  end
end
