class Admin::ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.all
  end

  #新規登録========================
  def new
    @item_image = ItemImage.new
  end
  def create
    @item_image = ItemImage.new(item_image_params)
    #投稿を保存するためにはストロングパラメータについての記載がなかったため（ストロングパラメータで投稿に問題がないかを判定する）

    if @item_image.save #登録出来たら追加した素材の詳細ページへ移る
      redirect_to admin_item_image_path(@item_image.id)
    else #できなかったら新規登録画面に戻る
      render 'new', danger: "登録に失敗しました"
    end

  end
  #================================

  #既存の素材情報======================
  def show
    @item_image = ItemImage.find(params[:id])
  end
  def edit
    @item_image = ItemImage.find(params[:id])
    if @item_image.update(item_image_params)#更新に成功したら素材の詳細ページへ移る
      redirect_to admin_item_image_path(@item_image.id)
    else#できなければ編集画面へ
      render 'edit'
    end
  end
  def destroy
    item_image = ItemImage.find(params[:id])
    item_image.destroy
    redirect_to admin_item_images_path #一覧ページへ
  end

  #====================================

  private#ストロングパラメータ======================

  def item_image_params
    params.require(:item_image).permit(:item_title, :image, :item_introduction)
  end

end
