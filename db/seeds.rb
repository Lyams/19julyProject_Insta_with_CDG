# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@users = []
@filename = []
@names = [Faker::GreekPhilosophers.name, Faker::Fantasy::Tolkien.character, Faker::JapaneseMedia::StudioGhibli.character]
3.times do
  @names.each do |name|
  @users << User.create!(
    email:  Faker::Internet.email ,
    password_confirmation:  'password1' ,
    password:  'password1' ,
    name:  name,
    bio:  Faker::Lorem.characters )
  end
 end

25.times do
  @filename << 'spec/fixtures/files/Jove_decadent.jpg'
  @filename << 'public/placeholders/The_Girl(1665).jpg'
  @filename << 'public/placeholders/Vermeer-view-of-delft.jpg'
  Post.create!(
    user: @users.sample,
    description:  Faker::GreekPhilosophers.quote ,
    image: File.new(Rails.root.join(@filename.sample)))
end
