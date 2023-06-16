Rails.application.routes.draw do

  namespace :admin do
    #get 'items' => 'items#index'
    #get 'items/new'
    #get 'items/:id' => 'items#show'
    #get 'items/:id/edit' => 'items#edit'
    #post 'items' => 'items#create'
    #patch 'items/:id' =>'items#update'
    resources :items, except: [:destory]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  scope module: :public do
    root :to => 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/my_page/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :destroy, :create]
    resources :cart_items do
      collection do
      delete 'destroy_all'
      end
    end
    patch 'cart_items/:id' => 'cart_items#update', as: :cart_item_update
    #delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
