Rails.application.routes.draw do
  resources :body_references
  resources :in_body_orientations
  resources :body_areas
  resources :injuries
  resources :roles
  resources :photographs
  resources :explications
  resources :institutions
  resources :people
  resources :autopsies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
