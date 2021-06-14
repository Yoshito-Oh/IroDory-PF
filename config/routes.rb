Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: 'homes#top'

  #管理者アクション=====
  namespace :admin do
    resources :item_images
    resources :post_images ,only: [:index, :show]
    resources :pending_images ,only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end
  #=====================

  #ログイン時可能のアクション==
  namespace :public do
    resources :post_images
    resources :item_images, only: [:index, :show]
    resources :users, only: [:show, :edit, :update, :destroy] #do
      #collection do
       # get 'unsubscribe'
      #end
    #end
    
  end
  #======================================

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
