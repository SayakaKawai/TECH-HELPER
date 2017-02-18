Rails.application.routes.draw do
  devise_for :users
  root   'questions#index'   #ルートパスの指定
  resources :questions do
    resources :answers, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end