FactoryBot.define do
  factory :user do
    name { "specuser" }
    email { "spec@gmail.com" }
    password { "specspec" }

    after(:create) do |user|
      status = create(:status, user: user)
    end
  end
end
