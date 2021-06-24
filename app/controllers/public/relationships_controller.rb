class Public::RelationshipsController < ApplicationController
  #ログインユーザのみアクセス可
  #before_action :authenticate_user!
  
  def create
    follow = current_user.active_relationships.build(followed_id: params[:user_id])
    follow.save
    redirect_to request.referer
  end

  def destroy
    follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
    follow.destroy
    #以下、全ユーザのフォローフォロワーを0にするコード
    #users = User.all
    #users.each do |user|
    #  user.active_relationships.destroy_all
    #  user.passive_relationships.destroy_all
    #end
    redirect_to request.referer
  end
end
