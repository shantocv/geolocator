Rails.application.routes.draw do
  resources :locations
  resources :places, except: [:update, :edit, :destroy]
  resources :distances, only: [:new, :create]
  get "near_by_stores" => "places#near_by_stores"
  post "find_near_by_stores" => "places#find_near_by_stores"
  root 'places#near_by_stores'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
