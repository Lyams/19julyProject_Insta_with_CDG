class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :description, presence: true, length: { minimum: 2 }
  validates :image_data, presence: true
  validates :title, presence: true, length: { minimum: 1, maximum: 25}
  before_save do
    image_derivatives! if valid?
  end
  paginates_per 8
end
