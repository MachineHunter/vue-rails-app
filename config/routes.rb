Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  namespace :api, format: 'json' do
    resources :user_pages, only: [:show]

    scope :avatar do
      get 'index/:id', to: 'avatar#index', as: 'avatar_index'
    end

    namespace :avatar do
      post 'update'
    end

    resources :command
  end

  resources :user_pages, only: [:show]

  resources :command_pages, only: [:index, :new, :show] do
    get 'download/:id', to: 'command_pages#download', on: :collection, as: 'download'
  end

  root to: "command_pages#index"
end
