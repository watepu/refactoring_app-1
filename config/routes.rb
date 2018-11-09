Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures
  resources :users
  resources :favorites, only: [:index, :create, :destroy]

  root 'pictures#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
