class PostImage < ApplicationRecord
  attachment :image

  #バリデーション==================
  validates :title, presence: true

  #================================

  #アソシエーション----------------
  belongs_to :user
  belongs_to :item_image
  has_many :favorites, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  #--------------------------------

  #いいね機能--------------------------------
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  #------------------------------------------

  #タグ検索機能の追加====================
  acts_as_taggable_on :tags, :skills
  #scope :by_join_date, order("created_at DESC")
  #======================================

end

  #PostImage.tagged_with(params[:tag])
  #PostImage.tagged_with("タグ1")[0].id
  #PostImage.tagged_with("タグ1, タグ2")[0].id
  #PostImage.tagged_with("タグ1").by_join_date
  #User.tagged_with("タグ1").by_join_date.paginate(page: params[:page], per_page: 20)
  # 完全一致(AND検索)
  #User.tagged_with(["タグ1", "タグ2"], match_all: true)
  # 条件一致(OR検索)
  #User.tagged_with(["タグ1", "タグ2"], any: true)
  # 除外(含まないモノを検索)
  #User.tagged_with(["タグ1", "タグ2"], exclude: true)