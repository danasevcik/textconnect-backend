Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      # USERS
      resources :users, only: [:create, :show, :update, :index]
      # CONVERSATIONS
      resources :conversations, only: [:index, :create, :show, :update]
      # MESSAGES
      resources :messages, only: [:create]
      # USERCONVERSATIONS
      resources :user_conversations, only: [:create]
      # FRIENDSHIPS
      resources :friendships, only: [:create]
      # retrieve profile
      get '/profile', to: 'users#profile'
      # get user on refresh
      get '/get_user', to: 'users#get_user'
      # login -> auth controller
      post '/login', to: 'auth#create'
      # show specific conversation
      post '/conversations/:id', to: 'conversations#show'
      # replaced with speech synthesis on front end
      # post '/listen-to-message', to: 'messages#listen'
      # add contact -> users controller
      post '/add-contacts', to: 'users#non_amigas'
      # remove contact -> friendships controller
      post '/remove-friend', to: 'friendships#remove'
      # find message author -> messages controller
      post '/message-author', to: 'messages#author'
    end
  end
  mount ActionCable.server => '/cable'
end
