
FactoryBot.define do
  factory :like do
    association :post
    association :user
    user_id {:second_user}
    post_id {:post}
  end
end