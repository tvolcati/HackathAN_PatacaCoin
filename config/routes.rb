Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :archives do
    member do
      get :download
    end
  end

  resources :archives

  # Defines the root path route ("/")
  # root "articles#index"
end
