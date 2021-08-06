class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :commentary, presence: true, length: {minimum: 3}
end
