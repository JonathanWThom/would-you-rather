Rails.application.routes.draw do
  devise_for :users
  root :to => 'questions#index'
  resources :questions do
    resources :responses
  end

  #do I need nested routes?
  #get rid of extra ones eventually
end
