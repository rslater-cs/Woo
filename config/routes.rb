Rails.application.routes.draw do
  resources :tutors
  resources :children
  resources :adults
  devise_for :users, controllers: {
  	sessions: 'users/sessions'
  }
  resources :addresses
  root "home#home"

  get "/home", to: "home#home"
  # Sign up might require a call to hte adult controller.
end
