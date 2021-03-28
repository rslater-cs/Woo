Rails.application.routes.draw do
  devise_for :users
  root "home#home"

  get "/home", to: "home#home"
end
