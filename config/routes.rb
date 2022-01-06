Rails.application.routes.draw do
  # namespace :api, defaults: { format: :json } do
  #   resources :users, only: %w[show]
  #   get '/member-data', to: 'members#show'
  # end

  devise_for :users, defaults: { format: :json },
    path: 'api',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
    
  get '/api/member-data', to: 'members#show'
end