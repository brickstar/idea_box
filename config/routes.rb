Rails.application.routes.draw do
  root 'welcome#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
  end

  resources :categories, only: [:index]

  resources :images, only: [:index]

  resources :users, only: [:index, :new, :create, :show] do
    resources :ideas, only: [:new, :create, :update, :edit]
  end
end
