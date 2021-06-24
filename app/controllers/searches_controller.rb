class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    
    unless @word == nil
      if @range == "投稿画像"
        @item_image = ItemImage.where(params[:item_image_id])
        @post_image = PostImage.where(['title LIKE ? ',  "%#{@word}%"])
      elsif @range == "線画素材"
        @item_image = ItemImage.where(['item_title LIKE ?', "%#{@word}%"])
      else #Userだったら
        @user = User.where(['nickname LIKE ? ',  "%#{@word}%"])
      end
    else
      render 'search'
    end
  end
end
