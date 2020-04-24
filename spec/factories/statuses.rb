FactoryBot.define do
  factory :status do
    automation { 1 }
    imagination { 1 }
    humor { 1 }
    enhancement { 1 }
    association :user
  end
end
