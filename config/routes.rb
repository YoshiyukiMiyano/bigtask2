Rails.application.routes.draw do
  resources :books do
    collection do
      post :confirm
    end
  end
end
