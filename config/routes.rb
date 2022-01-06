Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'

  resources :plans do
    member do
    get "like", to: "plans#upvote"
    get "dislike", to: "plans#downvote"
    end
    resources :resources, only: %i[create destroy]
    resources :tasks, only: %i[new create delete edit update destroy]
    resources :diary_entries
    resources :goals
  end

end
