Rails.application.routes.draw do
  root to: 'patients#index' 
  resources :doctors do
    resources :doctor_schedules
    resources :patients do
      resources :tasks
      resources :patient_schedules
    end
  end
end