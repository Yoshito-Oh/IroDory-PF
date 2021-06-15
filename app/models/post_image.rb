class PostImage < ApplicationRecord
  attachment :post_image
  #バリデーション==================
  validates :post_title, presence: true
  
  #================================
  
  #アソシエーション----------------
  belongs_to :user
  belongs_to :item_image
  #--------------------------------
end
