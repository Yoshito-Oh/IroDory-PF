class ItemImage < ApplicationRecord
  #画像認識
  attachment :image

  #バリデーションの追加=========
  validates :title, presence: true
  validates :image, presence: true
  validates :introducution, presence: true
  validates :status, inclusion:{in: [true, false]}
  #============================

  #アソシエーション============
  has_many :post_images, dependent: :destroy
  #============================
end
