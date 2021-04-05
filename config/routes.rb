Rails.application.routes.draw do
  resources :accesses
  resources :tutor_client_relationships
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  get 'pages/about_us'
  get 'pages/contact'
  get 'pages/tutor_list'
  root "pages#home"
end
