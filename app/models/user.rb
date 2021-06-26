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
  #------------------------------------------

  #フォロー/フォロワー機能==========================================
  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed #follower(前)

  has_many :passive_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower #followed(前)

  def following?(other_user)
    self.followings.include?(other_user)
  end
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  #================================================================

end
