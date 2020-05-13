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

    scope :user_pages do
      get 'index/:id', to: 'user_pages#index', as: 'user_pages_index'
    end

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

  get 'user_pages/index' 
  get 'command_pages/index'
  resources :command_pages, only: [:index, :new, :show] do
    get 'download/:id', to: 'command_pages#download', on: :collection, as: 'download'
  end

  root to: "user_pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
