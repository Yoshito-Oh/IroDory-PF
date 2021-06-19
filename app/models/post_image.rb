class PostImage < ApplicationRecord
  attachment :post_image
  #バリデーション==================
  validates :post_title, presence: true
  
  #================================
  
  #アソシエーション----------------
  belongs_to :user, dependent: :destroy
  belongs_to :item_image, dependent: :destroy
  #--------------------------------
end
