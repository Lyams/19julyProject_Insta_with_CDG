class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments,  dependent: :destroy
  belongs_to :user
  has_many :likes
  validates :description, presence: true
  validates :image_data, presence: true
end
