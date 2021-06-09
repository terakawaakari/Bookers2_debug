Rails.application.routes.draw do
  root 'homes#top'

  get 'home/about' => 'homes#about'

  devise_for :users

  resources :users,only: [:show,:index,:edit,:update] do
    resources :likes, only: [:index]
  end

  resources :books do
    resource :likes, only: [:create, :destroy]
  end

end