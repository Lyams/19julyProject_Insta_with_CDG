FactoryBot.define do
  factory :post do
    association :user
    description { Faker::GreekPhilosophers.quote }
    factory :post_invalid_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/notimage.txt'), 'text/plain')}
    end
    #image_data { TestData.image_data }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/Jove_decadent.jpg'),'image/jpeg')}
  end

end