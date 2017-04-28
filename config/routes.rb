Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :participants
    resources :teams do
      get 'participant_teams/new'
      post 'participant_teams/new'
      post 'participant_teams/create'
      resources :points
    end
  end
  # post 'events/pendaftaran'
  get 'events/latest'
  root to: 'events#latest'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
