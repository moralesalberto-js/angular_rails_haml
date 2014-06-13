Rails.application.routes.draw do

  root 'angular_application#index'

  resource :events

  resource :sessions, :only => [:create]
  get 'sign_in' => 'sessions#new'
  get 'sign_out' => 'sessions#destroy'

end
