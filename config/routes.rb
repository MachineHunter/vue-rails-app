Rails.application.routes.draw do
  namespace :api do
    namespace :practice do
      get 'practice/index'
    end
  end
  get 'practice/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
