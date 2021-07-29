FactoryBot.define do
  factory :user do
    id {1}
    email { Faker::Internet.email}
    password_confirmation { 'password1' }
    password { 'password1' }
    name {Faker::GreekPhilosophers.name}
    bio {Faker::Lorem.characters}
  end
end
