Rails.application.routes.draw do
  root to: 'patients#index'

  resources :doctors do
    resources :doctor_schedules
    resources :patients do
      resources :tasks do
        member do
          patch 'toggle_complete' # toggle_complete アクションのルートを追加
        end
      end
      resources :patient_schedules
    end
  end
end
