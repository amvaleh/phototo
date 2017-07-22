Rails.application.routes.draw do

  resources :photos do
    collection do
      post :check
    end
    member do
      get :download
      post :alert_photo_ready
    end
  end

  get 'home/index'

  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
