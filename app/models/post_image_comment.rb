class PostImageComment < ApplicationRecord
  #バリデーション=====================
  validates :comment, presence: true
  #コメント0文字はエラー
  #==================================
  
  belongs_to :user
  belongs_to :post_image
  
end
