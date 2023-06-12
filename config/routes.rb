Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'about', to: 'home#about'
  resources :admins
  resources :courses
  resources :departments
  resources :scores
  resources :students
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get "/dashboard", to: "dashboard#index"
  resources :categories
end
