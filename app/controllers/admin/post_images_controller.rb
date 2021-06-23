class Admin::PostImagesController < ApplicationController
  def index
    @post_images = PostImage.find_by(status: true)
    @pending_images = PostImage.find_by(status: false)
  end
  
  def show
    @post_image = PostImage.find(params[:id])
  end
  
  private
  
  
  
end
