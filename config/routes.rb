Rails.application.routes.draw do
  resources :genres
  resources :media
  resources :mangas
  devise_for :users
  #devise_for :administrators
  root 'home#index'
  get 'home/private'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   #root 'home#index'
   #resources :pokemons, only: [:index, :show]
end
