class Public::PostImagesController < ApplicationController
  #新着イラスト一覧表示==========================
  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    #新しく投稿されたものから表示させる
  end
  #==============================================

  #新規登録画面==================================
  def new
    @post_image = PostImage.new
    @item_image = ItemImage.find(params[:id])
  end
  def create
    @post_image = PostImage.new(post_image_params)

    if @post_image.save #登録出来たら
      redirect_to public_post_image_path(@post_image.id), success: "投稿できました！"
    else
      @post_image = PostImage.page(params[:page]).reverse_order
      render 'index', danger: "投稿に失敗しました。"
    end
  end
  #==============================================

  #すでに投稿されているイラストの詳細ページ===========
  def show
    @post_image = PostImage.find(params[:id])
  end
  #===================================================

  #自分が投稿したイラストの編集・削除ページ==================
  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user.id != current_user.id
      redirect_to post_image_path(@post_image.id)
      #URLで編集ページに来てしまった時の対策として、そのイラストの詳細ページへリダイレクトする
    end
  end
  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_image_path(@post_image)
    else
      render 'edit'
      #更新ができなかったときは、編集前のedit画面に戻す
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
    #投稿ページ一覧に戻る（後で治すかも）
  end
  #====================================================


  private #ストロングパラメータ=================================================
  def post_image_params
    params.require(:post_image).permit(:title, :introduction, :image, :tag)
  end

end
