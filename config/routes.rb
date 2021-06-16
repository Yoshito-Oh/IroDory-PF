Rails.application.routes.draw do
  
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  devise_for :users
  root to: 'homes#top'
  get 'search' => 'public#search'

  #管理者アクション=====
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    
    resources :item_images
    resources :post_images ,only: [:index, :show]
    resources :pending_images ,only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
  end
  #=====================

  #ログイン時可能のアクション==
  namespace :public do
    resources :post_images, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :item_images, only: [:index, :show] do
      resource :post_images, only: [:show]
    end
    resources :users, only: [:show, :edit, :update, :destroy] #do
      #collection do
       # get 'unsubscribe'
      #end
    #end

  end
  #======================================

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
