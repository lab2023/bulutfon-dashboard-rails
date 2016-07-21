BulutfonDashboard::Engine.routes.draw do
  root to: 'dashboards#index'
  resources :cdrs, only: [:index, :show]
  resource :bulutfon_users
end
