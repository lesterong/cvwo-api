Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i[show]
    resources :tasks
  end

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
end