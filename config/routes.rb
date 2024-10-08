Rails.application.routes.draw do
  root to: 'patients#index' 
  resources :doctors do
    resources :doctor_schedules
    resources :tasks
  end

  resources :patients do
    resources :patient_schedules
  end
  
end
