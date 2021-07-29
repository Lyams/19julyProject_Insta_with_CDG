#PSW = Faker::Internet.password
FactoryBot.define do
  factory :user do
    id {1}
    email { Faker::Internet.email}
    # password_confirmation { PSW }
    # password { PSW }
      name {Faker::GreekPhilosophers.name}
    bio {Faker::Lorem.characters}
  end
end
