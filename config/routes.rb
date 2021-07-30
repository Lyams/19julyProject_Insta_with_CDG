Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[ show edit update index ] do
    resources :posts
    resources :followers, only: :index
    resources :followings, only: :index
  end
  resources :follows, only: %i[ create destroy ]
  resources :feed_posts, only: [:index]
  resources :comments, only: [:new, :create]
  resources :likes, only: %i[ new create destroy ]
  root to: "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
