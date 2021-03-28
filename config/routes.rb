Rails.application.routes.draw do
  root "home#home"

  get "/home", to: "home#home"
end
