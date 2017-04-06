Rails.application.routes.draw do
  mount MagicLamp::Genie, at: '/magic_lamp' if defined?(MagicLamp)

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apidocs, only: :index
  get '/docs' => redirect('/swagger-ui/dist/index.html?url=/apidocs')

  resources :lmml_files, only: %i(show create)

  resources :autopsies, except: :edit do
    collection do
      post :preview, to: 'autopsies/preview#show'
    end
    member do
      get :lmml_file, to: 'lmml_files#show'
      get :browse, to: 'autopsies/browse#show'
      get :edit_external, :edit_internal, :edit_analyses
      ExaminationType.all_names.each do |examination_name|
        resource examination_name, only: %i(create update)
        # new and edit routes are used for independent debugging of
        # examination forms
        resource examination_name, only: %i(new edit) if Rails.env.development?
      end
    end
  end

  resources :people, only: [:index]

  # Resources for has-many relations (for examinations)
  resources :livores_mortis, :rigores_mortis, :foreign_fluids,
            :pleura_foreign_fluids, :peritoneum_foreign_fluids,
            only: %i(create destroy)
end
