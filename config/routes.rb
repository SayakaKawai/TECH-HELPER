Rails.application.routes.draw do
  devise_for :users
  get 'questions/yet' => 'questions#yet'
  resources :questions do
    resources :answers, only: [:create]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
  root   'questions#index'   #ルートパスの指定

end