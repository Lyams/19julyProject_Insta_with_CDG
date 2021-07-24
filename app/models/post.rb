class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments,  dependent: :destroy
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes
end
