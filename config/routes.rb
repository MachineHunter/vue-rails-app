Rails.application.routes.draw do
  namespace :api do
    namespace :practice do
      get 'practice/index/:id', to: "practice#index"
    end
  end

  get 'practice/index'
  get 'practice/index2'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
