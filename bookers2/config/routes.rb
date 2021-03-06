Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    get :followings, :followers
    resource :relationships, only: [:create, :destroy]
  end
  #resources :relationships, only: [:create, :destroy]

  get '/search' => 'search#search'

end
