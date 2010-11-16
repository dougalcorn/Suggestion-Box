SuggestionBox::Application.routes.draw do
  devise_for :users

  root :to => 'topics#index'
  resources :topics
end
