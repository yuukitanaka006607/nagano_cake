Rails.application.routes.draw do
   devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  root to: "public/homes#top"
   scope module: :public do
    patch "customers/withdrawal" => "customers#withdrawal"
    get "public/items" => "items#index"
    resources :items, only: [:show]
    resources :customers, only: [:new, :create, :destroy, :update]
    get "/about" => "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    get "customers/check" => "customers#check"
    post "cart_items" => "cart_items#create"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:update, :destroy]
    get "cart_items" => "cart_items#index"

   end

   namespace :admin do
    resources :customers, only: [:show, :edit, :update]
    get "customers" => "customers#index"
    resources :items, only: [:new, :create, :show, :edit, :update]
    get "/" => "homes#top"
    get "items" => "items#index"
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
