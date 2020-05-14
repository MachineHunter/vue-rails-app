Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  namespace :api, format: 'json' do
    namespace :practice do
      get 'practice/index/:id', to: 'practice#index'
      get 'practice/index3'
      get "practice/image_show"
      post 'practice/create'
      put 'practice/update'
      delete 'practice/destroy'
    end

    resources :user_pages, only: [:show]

    scope :avatar do
      get 'index/:id', to: 'avatar#index', as: 'avatar_index'
    end
    namespace :avatar do
      post 'update'
    end

    resources :command
  end

  get 'practice/index'
  get 'practice/index2'
  get 'practice/index3'

  resources :user_pages, only: [:show]

  get 'command_pages/index'
  resources :command_pages, only: [:index, :new, :show] do
    get 'download/:id', to: 'command_pages#download', on: :collection, as: 'download'
  end

  root to: "command_pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
