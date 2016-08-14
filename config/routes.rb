Rails.application.routes.draw do
  resources :user_topics
  resources :user_boards
  resources :posts
  # resources :topics
  resources :boards do
    resources :topics
  end
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  devise_scope :user do
    get '/auth/:provider/callback', to: 'users/sessions#create'
  end
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }
  end
  

end
