class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :description, presence: true, length: { minimum: 2 }
  validates :image_data, presence: true
  before_save do
    image_derivatives! if valid?
  end
end
