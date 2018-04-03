Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#show", page: "home"

  post '/charge_categories', to: 'chargecategories#create'

  resources :charges
  # resources :categories

  resources :budgets, only: [:index, :show] do
    resources :categories, only: [:new, :create, :index]
  end
end
