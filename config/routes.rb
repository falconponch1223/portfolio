Rails.application.routes.draw do
  namespace :admins do
    get 'posts/index'
    get 'posts/show'
  end
  root 'top#top'

  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    passwords:     'stores/passwords',
    registrations: 'stores/registrations'
  }

  namespace :stores do
    root 'stores#top'
    resources :stores, only: [:show, :edit, :update]
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :users do
    resources :users, only: [:show, :edit, :update]
    resources :posts do
      resources :favorites, only: [:create, :destroy]
      resources :post_comments,only: [:create, :destroy]
    end
    resources :stores,only: [:index, :show]

  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    resources :users, only: [:show, :index]
    resources :stores, only: [:show, :index]
    resources :posts, only: [:show, :index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
