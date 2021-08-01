class Public::FavoritesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    #指定したカラムの情報を抽出する。⇒select(:指定カラム)
    #詳細ページに表示されているIDを検索し、post_imageに情報を格納する
    favorite = current_user.favorites.new(post_image_id: post_image.id)
    # 3行目で格納したpost_imageのIDをいいねに「現在ログインしているユーザの新しいいいね」として格納
    favorite.save
    #情報を保存
    redirect_to public_item_image_post_image_path(post_image.item_image.id, post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    #詳細ページに表示されているIDを検索し、post_imageに情報を格納する
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    #いいねを破棄
    redirect_to public_item_image_post_image_path(post_image.item_image.id, post_image)
  end
end
