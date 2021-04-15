Rails.application.routes.draw do
  root "home#top"
  devise_for :users

  resources :games, except: [:new]

  get "/new", to: "games#new", as: "new_game"

  post "/locale", to: "home#change_locale"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
