Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show]
      resources :conversations, only: [:index, :create, :show]
      resources :messages, only: [:create]
      resources :user_conversations, only: [:create]
      resources :friendships, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/get_user', to: 'users#get_user'
      post '/add-contacts', to: 'users#non_amigas'
      # get '/Contacts', to: 'users#amigas'
    end
  end
  mount ActionCable.server => '/cable'
end
