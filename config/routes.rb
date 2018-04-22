Rails.application.routes.draw do
  root to: 'urls#new'
  resources :urls, only: :create
  get "/:short_url", to: "urls#shortened"
  get "shortened/:short_url", to: "urls#show", as: :shortened
  
end
