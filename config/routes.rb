Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update]
      resources :conversations, only: [:index, :create, :show, :update]
      resources :messages, only: [:create]
      resources :user_conversations, only: [:create]
      resources :friendships, only: [:create]
      get '/profile', to: 'users#profile'
      get '/get_user', to: 'users#get_user'
      post '/login', to: 'auth#create'
      post '/conversations/:id', to: 'conversations#show'
      post '/listen-to-message', to: 'messages#listen'
      post '/add-contacts', to: 'users#non_amigas'
      post '/remove-friend', to: 'friendships#remove'
      # get '/Contacts', to: 'users#amigas'
    end
  end
  mount ActionCable.server => '/cable'
end
