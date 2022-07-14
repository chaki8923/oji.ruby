Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',controllers:{
    registrations: 'auth/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    resources :messages, only: [:destroy] do
      resources :likes,only: [:create]
    end
    
    resources :users do
      resources :rooms,only: [:index,:create,:destroy,:show]
      resources :avatars,only: [:new,:index,:create,:destroy,:show]
      resources :user_rooms,only: [:create,:destroy]
    end
    
    resources :rooms do
      resources :messages, only: [:index]

    end
    resources :likes,only: [:destroy]
    
end
