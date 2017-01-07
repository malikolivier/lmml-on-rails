Rails.application.routes.draw do
  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
    put :update, to: 'autopsies#update'
    put :external_outline_examinations, to: 'external_outline_examinations#update'
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]

  resources :livores_mortis, only: [:create, :destroy]
end
