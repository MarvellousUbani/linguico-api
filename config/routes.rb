Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :students
      resources :appointments
      resources :teachers
    end
  end  
  post 'auth/login', to: 'authentication#authenticate'
end
