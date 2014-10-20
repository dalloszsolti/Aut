Aut::Application.routes.draw do

get "password_resets/new"

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "topics" => "topics#index", :as => "topics"
get "new_topic" => "topics#new", :as => "new_topic"
root :to => "users#index"

 resources :users do
  resources :topics
end

 resources :user do
  resources :comments
end

resources :topics do
 resources :comments, :only => [:create]
end

resources :sessions
resources :password_resets

end

