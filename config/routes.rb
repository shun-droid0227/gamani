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
    resources :users
  end

  resources :posts

end