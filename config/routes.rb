Rails.application.routes.draw do

  namespace :admin do
    get 'items' => 'items#index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
    post 'items' => "items#create"
  end

  scope module: :public do
    root :to => 'homes#top'
    get 'about' => 'homes#about'
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    get 'customers/confirm' => 'customers#confirm'
    get 'items/index'
    get 'items/show'
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
