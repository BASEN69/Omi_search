Rails.application.routes.draw do

  get 'genre/new'
  get 'genre/index'
  get 'genre/show'
  get 'genre/edit'
  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy, :edit, :update]
  end
  get '/mypage', to: 'users#my_page', as: 'mypage'
  resources :users, only: [:show, :edit, :update, :index, :destroy]
  get '/about' => 'homes#about', as: 'about'
  resources :genres, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  get "/search", to: "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
