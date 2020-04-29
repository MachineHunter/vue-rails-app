Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => "users/registrations"
  }

  namespace :api do
    namespace :practice do
      get 'practice/index/:id', to: 'practice#index'
      get 'practice/index3', { :format => 'json' }
      get "practice/image_show"
      post 'practice/create'
      put 'practice/update'
      delete 'practice/destroy'
    end

    namespace :user_pages do
      get 'index', { :format => 'json' }
    end

    namespace :avatar do
      get 'index', { :format => 'json' }
      post 'update', { :format => 'json' }
    end
  end

  get 'practice/index'
  get 'practice/index2'
  get 'practice/index3'

  get 'user_pages/index' 

  root to: "user_pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
