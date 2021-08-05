class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :comments,  dependent: :destroy
  belongs_to :user
  has_many :likes
  validates :description, presence: true, length: {minimum: 2}
  validates :image_data, presence: true
  before_save do
    if valid?
      image_derivatives!
    end
  end
end
