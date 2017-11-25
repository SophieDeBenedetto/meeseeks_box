Rails.application.routes.draw do
  root 'searches#new'
  resources :searches, only: [:new, :create]
  get 'about', to: "about#show"
end
