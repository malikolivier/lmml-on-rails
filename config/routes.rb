Rails.application.routes.draw do
  resources :drugs
  resources :test_triages
  resources :test_histopathologies
  resources :test_blood_type_experiments
  resources :test_blood_types
  resources :photographs
  resources :explications
  resources :institutions
  resources :roles
  resources :people
  resources :autopsies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
