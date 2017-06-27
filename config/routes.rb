Rails.application.routes.draw do
  mount MagicLamp::Genie, at: '/magic_lamp' if defined?(MagicLamp)

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :apidocs, only: :index
  get '/docs' => redirect('/swagger-ui/dist/index.html?url=/apidocs')

  resources :lmml_files, only: %i[show create]

  resources :autopsies, except: :edit do
    collection do
      post :preview, to: 'autopsies/preview#show'
    end
    member do
      get :lmml_file, to: 'lmml_files#show'
      get :browse, to: 'autopsies/browse#show'
      get :edit_external, :edit_internal, :edit_analyses
      ExaminationType.all_names.each do |examination_name|
        resource examination_name, only: %i[create update] do
          resources :injuries, only: %i[index create]
          resources :injuries, only: :new if Rails.env.development?
        end
        # new and edit routes are used for independent debugging of
        # examination forms
        resource examination_name, only: %i[new edit] if Rails.env.development?
      end
      AnalysisType.all_names.each do |analysis_name|
        resource analysis_name, only: %i[create update]
        # new and edit routes are used for independent debugging of
        # analysis forms
        resource analysis_name, only: %i[new edit] if Rails.env.development?
      end
      resources :analysis_others, only: %i[create update]
    end
    resources :autopsy_photograph_takings, shallow: true,
                                           only: %i[index create update destroy]
    resources :autopsy_photograph_takings, only: :new if Rails.env.development?
  end

  resources :people, only: [:index]

  # Resources for has-many relations (esp. for examinations)
  resources :livores_mortis, :rigores_mortis, :foreign_fluids,
            :pleura_foreign_fluids, :peritoneum_foreign_fluids,
            :participations,
            :analysis_histopathology_on_organs, :instant_view_drug_results,
            :triage_drug_results, :found_poisons,
            only: %i[create destroy]

  resources :injuries, only: %i[show update destroy] do
    collection do
      get :store, to: 'injuries/store#show'
    end
  end
  resources :injuries, only: :edit if Rails.env.development?

  resources :photographs, only: :destroy
end
