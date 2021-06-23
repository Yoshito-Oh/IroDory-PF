class Admin::AppliesController < ApplicationController
  def index
    @pending_images = PostImage.where(status: false)
  end

  def show
    #showについては1件の情報のみ取得したい
    @pending_image = PostImage.where(status: false).find(params[:id])
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
    @post_image = PostImage.find(params[:id])
  end

  def reject
  end
  
end
