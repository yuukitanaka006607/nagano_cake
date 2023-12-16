Rails.application.routes.draw do
  root to: "public/homes#top"
  get "public/homes/about" => "public/homes#about"
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  get "public/customers/my_page" => "public/customers#my_page"
  get "admin/" => "admin/homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
