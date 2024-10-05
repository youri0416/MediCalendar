Rails.application.routes.draw do
  root to: 'home#index' 
  resources :doctors do
    resources :doctor_schedules
  end

  resources :patients do
    resources :patient_schedules
  end
  
end
