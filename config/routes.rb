Rails.application.routes.draw do
  # adding an update 
  resources :plants, only: [:index, :show, :create, :update]
end
