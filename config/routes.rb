Rails.application.routes.draw do
  mount MagicLamp::Genie, at: '/magic_lamp' if defined?(MagicLamp)

  root to: 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :autopsies, only: %i[new show index create destroy] do
    get :lmml_file, to: 'api/lmml_files#show'
    member do
      get :browse, to: 'autopsies/browse#show'
      get :edit_external, :edit_internal, :edit_analyses
    end
  end

  get '/docs' => redirect('/swagger-ui/dist/index.html?url=/api/docs')

  namespace :api, format: :json do
    resources :docs, only: :index
    resources :lmml_files, only: %i[show create]
    resources :autopsies, only: %i[show index create update destroy] do
      collection do
        post :preview, to: 'autopsies/preview#show'
      end
      member do
        ExaminationType.all_names.each do |examination_name|
          resource examination_name, only: %i[create update] do
            resources :injuries, only: %i[index create]
          end
        end
        AnalysisType.all_names.each do |analysis_name|
          resource analysis_name, only: %i[create update]
        end
      end
    end

    resources :injuries, only: %i[show update destroy] do
      collection do
        get :store, to: 'injuries/store#show'
      end
    end

    resources :people, only: :index
  end

  if Rails.env.development?
    resources :autopsies, only: %i[] do
      member do
        ExaminationType.all_names.each do |examination_name|
          # Uses API controller directly to avoid controller duplication
          exam_controller = "api/#{examination_name.pluralize}"
          resource examination_name, only: %i[new edit],
                                     controller: exam_controller do
            resources :injuries, only: :new
          end
        end
        AnalysisType.all_names.each do |analysis_name|
          resource analysis_name, only: %i[new edit],
                                  controller: "api/#{analysis_name.pluralize}"
        end
      end
    end
    resources :injuries, only: :edit
  end

  resources :autopsies, only: [] do
    member do
      resources :analysis_others, only: %i[create update]
    end
    resources :autopsy_photograph_takings, shallow: true,
                                           only: %i[index create update destroy]
    resources :autopsy_photograph_takings, only: :new if Rails.env.development?
  end

  # Resources for has-many relations (esp. for examinations)
  resources :livores_mortis, :rigores_mortis, :foreign_fluids,
            :pleura_foreign_fluids, :peritoneum_foreign_fluids,
            :participations,
            :analysis_histopathology_on_organs, :instant_view_drug_results,
            :triage_drug_results, :found_poisons, :biochemical_analyses,
            :biochemical_analysis_results,
            only: %i[create destroy]

  resources :photographs, only: :destroy

  resources :biochemical_analyses, only: %i[show update]
end
