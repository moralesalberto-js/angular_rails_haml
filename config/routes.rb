Rails.application.routes.draw do

  root 'angular_application#index'

  resources :events, :only => [:index, :create, :destroy]

  resource :sessions, :only => [:create]
  get 'sign_in' => 'sessions#new'
  get 'sign_out' => 'sessions#destroy'

end
