class Admin::UsersController < ApplicationController
 #(管理者側)ユーザー一覧====================
  def index
    @users = User.all
  end
  #=========================================
  
  #管理者側のユーザ詳細画面=================
  def show
    @user = User.find_by(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if User.update(user_params)
      redirect_to public_user_path(@user.id)
    else
      render 'edit'
    end
  end
  #==========================================
  
  private #ストロングパラメータ=======================
  
  def user_params
    params.require(:user).permit(:status)
    #管理者側が変更できるのは退会ステータスのみのため
  end
end
