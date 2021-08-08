FactoryBot.define do
  factory :comment do
    association :post
    association :user
    commentary { Faker::GreekPhilosophers.quote }
  end
end
