Rails.application.routes.draw do
  namespace :api do
    namespace :practice do
      get 'practice/index/:id', to: 'practice#index'
      get 'practice/index3', { :format => 'json' }
      post 'practice/create'
      put 'practice/update'
    end
  end

  get 'practice/index'
  get 'practice/index2'
  get 'practice/index3'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
