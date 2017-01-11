Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
    put :update, to: 'autopsies#update'
    post :external_outline_examinations, to: 'external_outline_examinations#create'
    put :external_outline_examinations, to: 'external_outline_examinations#update'
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]

  resources :livores_mortis, only: [:create, :destroy]
  resources :rigor_mortis, only: [:create, :destroy]
end
