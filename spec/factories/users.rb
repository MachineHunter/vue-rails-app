FactoryBot.define do
  factory :user do
    name { 'specuser' }
    email { 'spec@gmail.com' }
    password { 'specspec' }

    after(:create) do |user|
      create(:status, user: user)
      create(:avatar, user: user)
    end
  end
end
