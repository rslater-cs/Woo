Rails.application.routes.draw do
  resources :families
  resources :accesses
  resources :tutor_client_relationships
  devise_for :users, :path => 'u'
  resources :users, only: [:index, :show, :new, :edit, :update, :create]

  get 'pages/about_us'
  get 'pages/contact'
  get 'pages/tutor_list'
  root "pages#home"
end
