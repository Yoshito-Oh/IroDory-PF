Rails.application.routes.draw do
  devise_for :admins
  get 'searches/search'
  get 'searches/detail'
  devise_for :users
  root to: 'homes#top'

  #管理者アクション====================~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    resources :item_images
    resources :post_images ,only: [:index, :show]
    resources :pending_images ,only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end
  #===================================================================

  #ログイン時可能のアクション======================================================
  namespace :public do
    resources :post_images, only: [:index, :edit, :update, :destroy]
    resources :item_images, only: [:index, :show] do 
      resources :post_images, only: [:new, :create]
    end
    resources :users, only: [:show, :edit, :update, :destroy] #do
      #collection do
       # get 'unsubscribe'
      #end
    #end

  end
  #=================================================================================

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
