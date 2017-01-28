Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  get 'people/index'

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies do
    get :browse
    put :update
    get :edit_internal
    get :edit_analyses
    define_examination_routes = lambda { |category, part|
      key_string_plural = "#{category}_#{part}_examination".pluralize
      resources key_string_plural, only: [:create, :new]
      put key_string_plural, to: "#{key_string_plural}#update"
      # This route is used for indenpendent debugging of examination form (like /new)
      get "#{key_string_plural}/edit", to: "#{key_string_plural}#edit"
    }
    [:outline, :head, :face, :neck, :trunk, :back, :upper_limbs, :lower_limbs,
     :genitalia, :anus].each do |part|
      define_examination_routes.call(:external, part)
    end
    [:cranium, :brain, :abdominal_wall, :neck_organs].each do |part|
      define_examination_routes.call(:internal, part)
    end
  end
  post 'autopsies/preview', to: 'autopsies#preview'

  resources :people, only: [:index]

  resources :livores_mortis, only: [:create, :destroy]
  resources :rigores_mortis, only: [:create, :destroy]
  resources :foreign_fluids, only: [:create, :destroy]
end
