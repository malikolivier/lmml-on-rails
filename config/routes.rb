Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
    put :update, to: 'autopsies#update'
    ExaminationType.order(:placement).each do |examination_type|
      key_string_plural = examination_type.key_string.pluralize
      post key_string_plural, to: "#{key_string_plural}#create"
      put key_string_plural, to: "#{key_string_plural}#update"
    end
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]

  resources :livores_mortis, only: [:create, :destroy]
  resources :rigores_mortis, only: [:create, :destroy]
end
