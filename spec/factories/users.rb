FactoryBot.define do
  factory :user do
    email { Faker::Internet.email}
    password_confirmation { 'password1' }
    password { 'password1' }
    name {Faker::GreekPhilosophers.name}
    bio {Faker::Lorem.characters}
    end

  factory :second_user do
    email { Faker::Internet.email}
    password_confirmation { 'password2' }
    password { 'password2' }
    name {Faker::GreekPhilosophers.name}
    bio {Faker::Lorem.characters}
  end
end
