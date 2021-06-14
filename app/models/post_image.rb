class PostImage < ApplicationRecord
  attachment :image
  #バリデーション==================
  validates :title, presence: true
  
  #================================
  
  #アソシエーション----------------
  belongs_to :user
  belongs_to :item_image
  #--------------------------------
end
