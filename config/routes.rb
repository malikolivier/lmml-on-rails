Rails.application.routes.draw do
  mount MagicLamp::Genie, at: "/magic_lamp" if defined?(MagicLamp)

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :autopsies, except: :edit do
    post :preview, on: :collection
    member do
      get :browse
      get :edit_external
      get :edit_internal
      get :edit_analyses
    end
    define_examination_routes = lambda { |category, part|
      key_string_plural = "#{category}_#{part}_examination".pluralize
      resources key_string_plural, only: [:create, :new]
      # The routes below do not use the examination model ID so they cannot
      # be created with the "resources" keyword above
      patch key_string_plural, to: "#{key_string_plural}#update"
      # This route is used for independent debugging of examination form (like :new)
      get "#{key_string_plural}/edit", to: "#{key_string_plural}#edit"
    }
    [:outline, :head, :face, :neck, :trunk, :back, :upper_limbs, :lower_limbs,
     :genitalia, :anus].each do |part|
      define_examination_routes.call(:external, part)
    end
    [:cranium, :brain, :abdominal_wall, :neck_organs,
     :pericardium, :heart, :thoracic_aorta, :lungs,
     :abdominal_aorta, :adrenal_glands, :kidneys, :spleen,
     :pancreas, :liver, :stomach, :intestines, :bladder, :genitalia,
     :back].each do |part|
      define_examination_routes.call(:internal, part)
    end
  end

  resources :people, only: [:index]

  # Resources for has-many relations (for examinations)
  resources :livores_mortis, :rigores_mortis, :foreign_fluids,
            :pleura_foreign_fluids, :peritoneum_foreign_fluids,
            only: [:create, :destroy]
end
