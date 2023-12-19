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
    resources :customers, only: [:new, :create, :destroy, :update]
    get "/about" => "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/information/edit" => "customers#edit"
    get "customers/check" => "customers#check"
    patch "customers/withdrawal" => "customers#withdrawal"
   end

   namespace :admin do
    resources :items, only: [:create, :new]
    get "/" => "homes#top"
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
