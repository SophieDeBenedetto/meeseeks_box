Rails.application.routes.draw do
  root 'searches#new'
  post "searches", to: "searches#create", as: :search_forms
  get 'about', to: "about#show"
end
