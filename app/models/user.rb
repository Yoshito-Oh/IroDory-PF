class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  #個人のプロフィールにおけるバリデーション=========================
  validates :name, presence: true
  validates :nickname, presence: true
  validates :introduction, {length: {maximum: 250}}
  validates :sex, inclusion: {in: [true, false]}
    #=================================================================

  #アソシエーション--------------------------
  has_many :post_images
  enum sex: {"男": true, "女": false}
  #------------------------------------------

end
