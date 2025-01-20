class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :post, touch: true
  broadcasts_to :post
end
