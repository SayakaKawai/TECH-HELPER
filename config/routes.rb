Rails.application.routes.draw do
  devise_for :users
  root   'questions#index'   #ルートパスの指定
  resources :questions do
    resources :answers, only: [:create]
  end
  resources :users, only: [:show]
end