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
    resources :users, only: [:show,:edit,:update]
  end

  resources :posts, only: [:index,:show,:create,:destroy]
  resources :post_comments, only: [:destroy]
  post '/post_comments/:id', to: 'post_comments#create', as: 'post_comments'


end