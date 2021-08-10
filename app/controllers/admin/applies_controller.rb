class Admin::AppliesController < ApplicationController
  def index
    @pending_images = PostImage.where(status: false)
  end

  def show
    #showについては1件の情報のみ取得したい
    
    @pending_image = PostImage.where(status: false).find(params[:id])
    @user = @pending_image.user
    @post_images = PostImage.where(user_id: @user.id).where(status: true)
    @item_image = ItemImage.find(@pending_image.item_image.id)
  end

  def update
    @pending_image = PostImage.find(params[:id])
    @pending_image.status = true
    #※今回、ユーザからの情報を受け取るわけではないので、「update」ではなく「save」
    if @pending_image.save
      redirect_to admin_apply_apply_path(@pending_image.id)
    else
      render admin_apply_path
    end
  end

  def apply
    @post_image = PostImage.select(:post_image_id)
  end

  def reason
    @post_image = PostImage.find(params[:post_image_id])
  end

  def reject_update
    @pending_image = PostImage.find(params[:post_image_id])
    #※今回、ユーザからの情報を受け取るわけではないので、「update」ではなく「save」
    @pending_image.reason = params[:reason]
    if @pending_image.save
      redirect_to admin_applies_reject_path
    else
      render admin_apply_path
    end
  end

  def reject
  end

  private#ストロングパラメータ======================

  def pending_image_params
    params.require(:post_image).permit(:reason)
  end


end
