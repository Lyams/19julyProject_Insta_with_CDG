FactoryBot.define do
  factory :follow do
    follower_id { :user }
    following_id { :second_user }
  end
end