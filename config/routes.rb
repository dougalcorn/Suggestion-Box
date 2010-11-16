SuggestionBox::Application.routes.draw do

  match '/auth/:provider/callback' => 'authentications#create', :as => :authentication_callback

  resources :authentications

  devise_for :users

  root :to => 'topics#index'
  resources :topics
end
