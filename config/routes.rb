Rails.application.routes.draw do
  #THIS NEEDS TO BE ABOVE THE RESOURCES!!!
  get 'users/legal'
  resources :subjects
  resources :tutor_subjects
  resources :families
  resources :accesses
  resources :tutor_client_relationships do
    post 'comments', to: 'comments#create'
  end

  devise_for :users, :path => 'u'
  resources :users, only: [:index, :show, :new, :edit, :update, :create]
  #resources :users do
    #resources :recruiters #-> url.com/users/:user_id/recruiters
  #end

  get 'pages/about_us'
  get 'pages/contact'
  get 'pages/hub'
  get 'pages/apiconnecting'
  get 'pages/room1'
  get 'pages/room2'
  get 'pages/room3'
  get 'pages/room4'
  get 'pages/room5'
  post 'request_contact', to: 'pages#request_contact'
  get 'pages/tutor_list'
  get 'pages/bootstrap_test'
  post 'tutor_booking', to: 'users#book_tutor', as: 'tutor_booking'
  root "pages#home"
end
