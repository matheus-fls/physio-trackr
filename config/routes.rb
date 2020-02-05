Rails.application.routes.draw do
  resources :users do
    resources :measures
  end
end
