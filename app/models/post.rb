class Post < ApplicationRecord
  validates :title, presence: true

  # 添加 dependent: :destroy 解决外键删除限制错误
  has_many :comments, dependent: :destroy
  has_rich_text :content
end
