Rails.application.routes.draw do

  devise_for :users

  resources :dares do
  	member do
  		put :like, to: 'dares#upvote'
  	end
  	collection do
  		get :search
  	end
  end


  get 'dashboard/index'

  # defaults to dashboard
  root :to => redirect('/dashboard')

  # view routes
  get '/dashboard' => 'dashboard#index'
  get '/newsfeed' => 'dares#feed'
  get '/users/search' => 'users#search'
end
