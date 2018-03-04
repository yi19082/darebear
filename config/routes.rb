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

  resources :dares do
    resources :comments
  end

  get 'dashboard/index'

  # defaults to dashboard
  root :to => redirect('/dashboard')

  # view routes
  get '/dashboard' => 'dashboard#index'
  get '/newsfeed' => 'dares#recent'

  get '/dareboard' => 'users#pending'
  get '/completed' => 'users#completed'
  get '/pending' => 'users#pending'
  get '/accepted' => 'users#accepted'

  get '/users/search' => 'users#search'
  get '/users/:id' => 'users#show', as: 'user'

  get '/users/:id/dareboard' => 'users#dareboard', as:'user_dareboard'
  get '/users/:id/completed' => 'users#completed', as:'user_completed'
  get '/users/:id/pending' => 'users#pending', as:'user_pending'
  get '/users/:id/accepted' => 'users#accepted', as:'user_accepted'

end
