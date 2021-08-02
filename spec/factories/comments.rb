
FactoryBot.define do
  factory :comment do
    association :post
    association :user
  end
end