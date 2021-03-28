Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  get 'pages/about_us'
  get 'pages/contact'
  root "pages#home"
end
