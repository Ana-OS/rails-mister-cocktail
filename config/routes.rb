Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"

  resources :cocktails, except: [:index] do
    resources :doses, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]

  resources :user, only: [] do
    collection do
      get :profile
      get :cocktails
      get :reviews
    end
  end
end
