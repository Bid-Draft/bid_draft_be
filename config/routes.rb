Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'cards', to: 'cards#index'
      post 'cards', to: 'cards#create'
      post 'game', to: 'games#create'
      get 'game', to: 'games#show'
    end
  end
end