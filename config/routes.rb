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
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    get "public/items" => "items#index"
    resources :items, only: [:show]
    get "/about" => "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    get "customers/check" => "customers#check"
    resources :customers, only: [:new, :create, :destroy, :update]
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]

   end

   namespace :admin do
    resources :customers, only: [:show, :edit, :update]
    get "customers" => "customers#index"
    resources :items, only: [:new, :create, :show, :edit, :update]
    get "/" => "homes#top"
    get "items" => "items#index"
    resources :orders, only: [:show]
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
