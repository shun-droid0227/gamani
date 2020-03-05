Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root :to => "users/sessions#new"
  end
  
  scope module: :users do
    resources :users, only: [:index,:show,:edit,:update]
    get '/home', to: 'users#home', as: 'users_home'
  end
  
  resources :posts, only: [:index,:show,:create,:destroy] do
    resources :favorites, only: [:create,:destroy]
  end
  
  resources :post_comments, only: [:destroy]
  post '/post_comments/:id', to: 'post_comments#create', as: 'post_comments'

  resources :chat_threads, only: [:index,:show,:create,:destroy]
  resources :game_tittles, only: [:index,:create,:destroy]
  resources :game_genles, only: [:index,:create,:destroy]
  resources :responses, only: [:create]
  resources :relationships, only: [:create,:destroy]
  
end