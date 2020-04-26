FactoryBot.define do
  factory :user do
    name { 'specuser' }
    email { 'spec@gmail.com' }
    password { 'specspec' }

    after(:create) do |user|
      create(:status, user: user)
      unless user.avatar.attached?
        user.avatar.attach(
          io: File.open("#{Rails.root}/spec/factories/images/eagle.jpg"),
          filename: "#{Time.zone.now.strftime('%Y%m%d%H%M%S%L')}.jpg"
        )
      end
    end
  end
end
