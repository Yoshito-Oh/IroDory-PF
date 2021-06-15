class ItemImage < ApplicationRecord
  #画像認識
  attachment :image

  #バリデーションの追加=========
  #validates :item_title, presence: true
  #validates :item_image, presence: true
  #validates :item_introduction, presence: true
  #validates :status, inclusion:{in: [true, false]}
  #============================

  #アソシエーション============
  has_many :post_images, dependent: :destroy
  #============================
end
