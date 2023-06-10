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
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    #get 'items' => 'items#index'
    #get 'items/:id' => 'items#show'
    resources :items, only: [:index, :show]
    patch 'customers/my_page/update' => 'customers#update'
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
