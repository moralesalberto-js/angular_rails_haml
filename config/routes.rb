Rails.application.routes.draw do

  root 'events#index'

  resources :events

  resource :sessions, :only => [:create]
  get 'sign_in' => 'sessions#new'
  get 'sign_out' => 'sessions#destroy'

end
