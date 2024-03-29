class Public::RelationshipsController < ApplicationController
  #ログインユーザのみアクセス可
  before_action :authenticate_user!
  
  def create
    follow = current_user.active_relationships.build(followed_id: params[:user_id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
    follow.destroy

    redirect_to request.referer
  end
end
