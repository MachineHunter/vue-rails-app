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

    namespace :user_pages do
      get 'index'
    end

    namespace :avatar do
      get 'index'
      post 'update'
    end

    resources :command, only: [:index, :show, :new, :create]
  end

  get 'practice/index'
  get 'practice/index2'
  get 'practice/index3'

  get 'user_pages/index' 
  get 'command_pages/index'
  resources :command_pages, only: [:index, :new, :show] do
    get 'download/:id', to: 'command_pages#download', on: :collection
  end

  root to: "user_pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
