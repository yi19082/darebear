Rails.application.routes.draw do

  devise_for :users

  resources :dares

  get 'dashboard/index'

  # defaults to dashboard
  root :to => redirect('/dashboard')

  # view routes
  get '/dashboard' => 'dashboard#index'

end
