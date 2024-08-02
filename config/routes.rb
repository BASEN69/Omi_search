Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get '/mypage', to: 'users#my_page', as: 'mypage'
  resources :users, only: [:show, :edit, :update, :index, :destroy]
  get '/about' => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
