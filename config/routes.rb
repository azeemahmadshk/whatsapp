Rails.application.routes.draw do
  root to: 'users#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :messages
  resources :user_rooms
  resources :settings
  mount Sidekiq::Web => '/sidekiq'
  # resources :users 
  resources :rooms do 
    get :user, on: :member
    resources :users
    resources :messages
    # get :user, on: :member , as: :room_user
  end
  mount ActionCable.server => '/room_channel'
#  get '/search_messages' => 'messages#search_messages', as: :search_messages
  #get '/all_members/:id' => 'rooms#all_members_in_room', as: :all_members
  #post '/add_user' => 'rooms#update'
  #post '/add_user' => 'users#add_user_to_room'
  #post '/send_message'=> 'messages#create'
  #get '/show_room' => 'messages#show_room_messages'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

