Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  namespace :api, format: 'json' do
    resources :user_pages, only: [:show]
    resources :avatar, only: [:create, :show]
    resources :command
  end

  resources :user_pages, only: [:show]

  resources :command_pages, only: [:index, :new, :show] do
    get 'download/:id', to: 'command_pages#download', on: :collection, as: 'download'
  end


  # root url
  root to: "command_pages#index"
end
