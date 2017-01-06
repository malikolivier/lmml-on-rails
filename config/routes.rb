Rails.application.routes.draw do
  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
    resources :external_outline_examinations, only: [:create, :update]
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]
end
