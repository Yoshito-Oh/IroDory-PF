class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == "投稿画像"
      @post_image = PostImage.where(['title LIKE ? ',  "%#{@word}%"])
    elsif @range == "線画素材"
      @item_image = ItemImage.where(['item_title LIKE ?', "%#{@word}%"])
    else #Userだったら
      @user = User.where(['nickname LIKE ? ',  "%#{@word}%"])
    end
  

  end
  
  def detail
    @range = params[:range]
    @word = params[:word]
    @tag = params[:tag]
    @user = params[:user]
    @amount = params[:amount]

    if @range == "投稿画像"
      @post_image = PostImage.where(['title LIKE ? ',  "%#{@word}%"])
    else 
      @item_image = ItemImage.where(['item_title LIKE ?', "%#{@word}%"])
    end
  end
end
