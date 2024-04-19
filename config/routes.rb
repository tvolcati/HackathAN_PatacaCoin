Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :archives do
    member do
      get :download
      get :review
    end
    resources :reviews, only: [:new, :create, :edit, :update] do
      member do
        patch :validate
      end
    end
  end
  resources :reviews, only: [:index, :show]
end
