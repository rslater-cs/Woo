Rails.application.routes.draw do
  resources :tutor_subjects
  resources :families
  resources :accesses
  resources :tutor_client_relationships
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  #resources :users do 
    #resources :recruiters #-> url.com/users/:user_id/recruiters
  #end

  get 'pages/about_us'
  get 'pages/contact'
  get 'pages/tutor_list'
  get 'pages/bootstrap_test'
  root "pages#home"
end
