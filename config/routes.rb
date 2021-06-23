Rails.application.routes.draw do
 
  get 'index/show'
  get 'index/apply'
  get 'index/reject'
  namespace :public do
    
  end
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
    get 'applies/index'
    get 'applies/show'
    get 'applies/apply'
    get 'applies/reject'
    resources :item_images
    resources :post_images ,only: [:index, :show]
    resources :pending_images ,only: [:index, :show, :edit, :update]
    resources :users, only: [:index, :show, :edit, :update]
    resources :applies, only: [:index, :show, :update] do
      get 'apply' => 'applies#apply'
    end
    get 'reject' => 'applies#reject'
  end
  #===================================================================

  #ログイン時可能のアクション======================================================
  namespace :public do
    resources :post_images, only: [:index, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :item_images, only: [:index, :show] do 
      resources :post_images, only: [:new, :show, :create]
    end
    resources :users, only: [:show, :edit, :update, :destroy] #do
      #collection do
       # get 'unsubscribe'
      #end
    #end
    get 'favorites/create'
    get 'favorites/destroy'
  end
  #=================================================================================

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
