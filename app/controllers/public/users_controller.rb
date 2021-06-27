class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    #post_image：全体で投稿された中で「current_user」でかつ「status:true」のもののみ
    @post_images = PostImage.where(status: true,user_id: @user.id)
    #pending_image：current_userで「status:false」のもののみ
    @pending_images = PostImage.where(status: false,user_id: @user.id)
    @post_image = PostImage.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
  end
  
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root
  end
  
  def following
    @user = User.find_by(id: params[:id])
    @users = @user.followings
  end
  
  def follower
    @user = User.find_by(id: params[:id])
    @users = @user.followers
  end
  
  private#ストロングパラメータ==========================================
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :status, :profile_header)
  end
  
  def post_image_params
    params.require(:post_image).permit(:title, :image, :status)
  end
  
end
