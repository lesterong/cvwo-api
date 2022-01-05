Rails.application.routes.draw do
  # namespace :api, defaults: { format: :json } do
  #   resources :users, only: %w[show]
  #   get '/member-data', to: 'members#show'
  # end

  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
    
  get '/api/member-data', to: 'members#show'
end