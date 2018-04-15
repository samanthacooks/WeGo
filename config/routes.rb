Rails.application.routes.draw do
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'
  post '/update/:token' => 'users#update'
  get '/users/:token/edit' => 'users#edit'
  resources :users, only: [:show, :new, :create, :update, :destroy]
  resources :password_resets, only: [:new, :create, :edit, :update]

  get '/events/:token' => 'events#index'
  post '/events/:token' => 'events#create'
  post '/events/update/:token' => 'events#update'
  delete '/events' => 'events#destroy'

  get 'eventbrite/index' => 'eventbrite#index'
  get 'eventbrite/categories' => 'eventbrite#categories'

  root 'users#new'
end
