class Public::ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.all
  end

  def show
    @item_image = ItemImage.find(params[:id])
  end
end
