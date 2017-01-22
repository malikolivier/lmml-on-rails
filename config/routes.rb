Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse, to: 'autopsies#browse'
    put :update, to: 'autopsies#update'
    [:external_outline, :external_head, :external_face, :external_neck]
    .each do |examination_type|
      key_string_plural = "#{examination_type}_examination".pluralize
      resources key_string_plural, only: [:create, :new]
      put key_string_plural, to: "#{key_string_plural}#update"
      # This route is used for indenpendent debugging of examination form (like /new)
      get "#{key_string_plural}/edit", to: "#{key_string_plural}#edit"
    end
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]

  resources :livores_mortis, only: [:create, :destroy]
  resources :rigores_mortis, only: [:create, :destroy]
  resources :foreign_fluids, only: [:create, :destroy]
end
