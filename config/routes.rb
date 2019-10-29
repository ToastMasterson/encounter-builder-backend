Rails.application.routes.draw do
  resources :encounters
  get "/monsters/search" => "monsters#search"
  post "/monsters/search" => "monsters#search"
  get "/masters/log_in" => "masters#log_in"
  post "/masters/log_in" => "masters#log_in"
  get "/encounters/get_monsters" => "encounters#get_monsters"
  post "/encounters/get_monsters" => "encounters#get_monsters"
  get "/encounters/add_monster" => "encounters#add_monster"
  post "/encounters/add_monster" => "encounters#add_monster"
  get "/encounters/remove_monster" => "encounters#remove_monster"
  post "/encounters/remove_monster" => "encounters#remove_monster"

  resources :masters
  resources :monsters
  resources :encounters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
