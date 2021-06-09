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
  
  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  put 'withdraw/:name' => 'users#withdraw'

end