Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'api/registrations',
    sessions: 'api/sessions'
  }

  namespace :api do
    #this is where ajax calls go
    get 'users/info'
  end

  #react router
  get '*unmatched_route', to: 'home#index'
  # VERY IMPORTANT nothing below this last route
end
