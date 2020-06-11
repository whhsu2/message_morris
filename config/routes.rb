Rails.application.routes.draw do
    root 'chatroom#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    post 'signup', to: 'sessions#signup'
    delete 'logout', to: 'sessions#destroy'
    post 'message', to: 'messages#create'
    
    mount ActionCable.server, at: '/cable'
end
