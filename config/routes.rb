Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  get 'posts' => 'posts#index'
  get "posts/today" => "posts#today"
  get "posts/ranking" => "posts#ranking"
  # get "posts/indexusername" => "posts#indexusername"
  get "users/likes/:id" => "users#likes"
  resources :users, only: [:show]
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
    resources :answers
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end