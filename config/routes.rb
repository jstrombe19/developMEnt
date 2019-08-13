Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, :goals, :tasks
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
end
