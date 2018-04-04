Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  post '/charge_categories', to: 'chargecategories#create'

  resources :users, only: [:new, :create, :show]
  # resources :charges

  resources :budgets, only: [:index, :show, :new, :create, :edit, :update] do
    resources :charges
    resources :categories, only: [:new, :create, :index]
  end
end
