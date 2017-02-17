Rails.application.routes.draw do
  root   'questions#index'   #ルートパスの指定
  resources :questions, only: [:index, :new]
end
