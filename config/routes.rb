Rails.application.routes.draw do
  devise_for :users

  get 'pages/about_us'
  get 'pages/contact'
  root "pages#home"
end
