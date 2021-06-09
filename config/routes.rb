Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

  #管理者アクション=====
  #namespace :admin do

  #end
  #=====================

  #ログイン時可能のアクション==
  #namespace :public do
  #end
  #======================================

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
