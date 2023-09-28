Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :questions do
    collection do
      get 'find'
    end
  end
  resource :tasks do
    collection do
      get 'index'
      get 'taskQs'
    end
  end
  resource :user_profiles do
    collection do
      get "userDashboard"
      get "updateLevel"
      get "users", to: "user_profiles#index"
    end
  end
end
