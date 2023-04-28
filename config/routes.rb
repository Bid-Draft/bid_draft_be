# frozen_string_literal: true

Rails.application.routes.draw do
  # action cable server
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      get 'cards/players', to: 'cards#index_players'
      get 'cards', to: 'cards#index'
      post 'cards', to: 'cards#create'
      post 'game', to: 'games#create'
      get 'game', to: 'games#show'
      post 'bids', to: 'bids#create'
      get 'bids', to: 'bids#index'
      post 'players', to: 'players#create'
    end
  end
end
