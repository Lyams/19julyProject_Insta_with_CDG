

FactoryBot.define do
  factory :post do
    association :user
    description {Faker::GreekPhilosophers.quote}
    factory :post_invalid_image do
      #image_data { FakeTestData.image_data }
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/notimage.txt'))}
    end
    image_data { TestData.image_data }
  end

end