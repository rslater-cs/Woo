Rails.application.routes.draw do
  get 'home', to: 'home#home'
  get 'contact', to: 'home#contact'
  get 'about', to: 'home#about'

  root 'home#home'
end
