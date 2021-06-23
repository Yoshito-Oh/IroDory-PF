class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  attachment :profile_header
  #個人のプロフィールにおけるバリデーション=========================
  validates :name, presence: true
  validates :nickname, presence: true
  validates :introduction, {length: {maximum: 250}}
  #validates :sex, inclusion: {in: [0, 1]}
    #=================================================================

  #アソシエーション--------------------------
  has_many :post_images, dependent: :destroy
  has_many :favorites, dependent: :destroy
  enum sex: {"男": 0, "女": 1} #enumは数字対応のため、boolean型とは相性が悪い
  #------------------------------------------

end
