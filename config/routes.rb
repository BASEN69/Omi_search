Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy, :index, :show]
    resources :posts, only: [:destroy, :show]
    resources :post_comments, only: [:destroy, :index]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

  scope module: :public do

    devise_for :users
    root to: 'homes#top'
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy, :edit, :update]
    end
    get '/mypage', to: 'users#my_page', as: 'mypage'
    resources :users, only: [:show, :edit, :update, :index, :destroy]
    get '/about' => 'homes#about', as: 'about'
    resources :genres, only: [:index, :show]
    get '/search', to: 'searches#search'
    get 'tagsearches/search', to: 'tagsearches#search'

    resources :maps, only: [:index, :show]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
