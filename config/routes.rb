Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
  end
end
