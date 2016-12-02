Rails.application.routes.draw do
  resources :roles
  resources :photographs
  resources :explications
  resources :institutions
  resources :people
  resources :autopsies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
