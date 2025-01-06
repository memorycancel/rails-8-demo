class Comment < ApplicationRecord
  belongs_to :post, touch: true
  broadcasts_to :post
end
