class Public::PostImagesController < ApplicationController
  #新着イラスト一覧表示==========================
  def index
    @post_images = PostImage.where(status: 'true').reverse_order#.page(params[:page]).reverse_order
    #新しく投稿されたものから表示させる
  end
  #==============================================

  #新規登録画面==================================
  def new
    @post_image = PostImage.new
    @item_image = ItemImage.find(params[:item_image_id])
  end
  def create
    item_image_id =  params[:item_image_id]
    @post_image = PostImage.new(post_image_params)
    @post_image.item_image_id = item_image_id
    @post_image.user_id = current_user.id
    if @post_image.save #登録出来たら
      redirect_to public_item_image_post_image_path(item_image_id, @post_image.id), success: "投稿できました！"
    else
      @post_images = PostImage.page(params[:page]).reverse_order
      render 'index', danger: "投稿に失敗しました。"
    end
    tags = Vision.get_image_data(@post_image.image)    
    tags.each do |tag|
      @post_image.tags.create(name: tag)
    end
  end
  #==============================================

  #すでに投稿されているイラストの詳細ページ===================================
  def show
    @post_image = PostImage.find(params[:id])
    use_item = @post_image.item_image_id
    @item_image = ItemImage.find(use_item)
    @user = @post_image.user
    @post_images = PostImage.where(user_id: @user.id).where(status: true)
    @post_image_comment = PostImageComment.new
   # @tags = @post_image.tag_counts_on(:tags)
  end
  #===========================================================================

  #自分が投稿したイラストの編集・削除ページ==================
  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user.id != current_user.id
      redirect_to public_item_image_post_image(@post_image.id)
      #URLで編集ページに来てしまった時の対策として、そのイラストの詳細ページへリダイレクトする
    end
  end
  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to public_item_image_post_image_path(@post_image.id)
    else
      redirect_to 'edit'
      #更新ができなかったときは、編集前のedit画面に戻す
    end
  end


  private #ストロングパラメータ=================================================
  def post_image_params
    params.require(:post_image).permit(:title, :img_introduction, :image, :tag_list, :art_supplies, :reason)
  end

end
