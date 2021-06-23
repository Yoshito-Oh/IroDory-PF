class Public::ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.all
  end

  def show
    @item_image = ItemImage.find(params[:id])
    @post_images = PostImage.where(status: true).where(item_image_id: @item_image.id)
  end
end
