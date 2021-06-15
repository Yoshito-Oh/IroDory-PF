class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
  end
  
  def destroy
    
  end
  
end
