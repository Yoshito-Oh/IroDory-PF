class Public::ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.page(params[:page]).reverse_order
  end

  def show
    @item_image = ItemImage.find(params[:id])
    @post_images = PostImage.where(status: true).where(item_image_id: @item_image.id)
    unless current_user.nil?
      @current_user_post_image = PostImage.where(status: true).where(user_id: current_user.id)
    end
  end

  def download
    download_file = ItemImage.find(params[:item_image_id])
    attacher = download_file.send(:"#{:image}_attacher")
    file = attacher.get
    send_file file.download, disposition: :attachment, type: 'image/png', filename: 'image.png'
    #/attachments/f1081e9aef0a07d35d292c58a0da4b21527ee2f0/store/6dcf4f1883b227943a788ac3071529a6aedffcf8a6947704484eaa6e549d/image.png
    #/attachments/f1081e9aef0a07d35d292c58a0da4b21527ee2f0/store/6dcf4f1883b227943a788ac3071529a6aedffcf8a6947704484eaa6e549d/image.png
    #/attachments/aab5c29bd5b8c5fd4bb3238228c5cbbedfbdd906/store/6dcf4f1883b227943a788ac3071529a6aedffcf8a6947704484eaa6e549d/image.png
  end
end
